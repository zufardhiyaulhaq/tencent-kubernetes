resource "tencentcloud_kubernetes_cluster" "cluster" {
  vpc_id                     = var.vpc_id
  cluster_name               = var.cluster_name
  cluster_version            = var.cluster_version
  cluster_os                 = var.cluster_os
  cluster_level              = var.cluster_level
  auto_upgrade_cluster_level = true

  network_type                 = "VPC-CNI"
  service_cidr                 = var.service_ip_cidr
  cluster_max_service_num      = var.cluster_max_service_num
  ignore_cluster_cidr_conflict = var.ignore_cluster_cidr_conflict
  eni_subnet_ids               = var.pod_ip_subnet_ids
  cluster_max_pod_num          = var.max_pod_per_node

  container_runtime = var.container_runtime
  runtime_version   = var.runtime_version

  upgrade_instances_follow_cluster = var.upgrade_instances_follow_cluster
  deletion_protection              = var.deletion_protection

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  lifecycle {
    ignore_changes = [
      cluster_level,
      cluster_intranet,
      cluster_intranet_subnet_id,
      cluster_internet,
      cluster_internet_security_group,
      kube_config,         // computed
      kube_config_intranet // computed
    ]
  }
}

resource "tencentcloud_security_group" "node_security_group" {
  name = "tke-node-${var.cluster_name}-sg"
}

resource "tencentcloud_security_group_rule_set" "node_security_group" {
  security_group_id = tencentcloud_security_group.node_security_group.id

  ingress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "ALL"
    port        = "ALL"
    description = "D:Allow ALL"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "ALL"
    port        = "ALL"
    description = "D:Allow ALL"
  }
}

resource "tencentcloud_kubernetes_node_pool" "node_pool" {
  for_each = var.node_pools

  vpc_id     = var.vpc_id
  cluster_id = tencentcloud_kubernetes_cluster.cluster.id

  name              = each.key
  enable_auto_scale = each.value.enable_autoscaling
  max_size          = each.value.max_capacity
  min_size          = each.value.min_capacity
  desired_capacity  = each.value.desired_capacity

  subnet_ids               = each.value.node_subnet_ids
  retry_policy             = each.value.retry_policy
  multi_zone_subnet_policy = each.value.multi_zone_subnet_policy

  dynamic "auto_scaling_config" {
    for_each = each.value.auto_scaling_config
    content {
      instance_type              = auto_scaling_config.value.instance_type
      system_disk_type           = auto_scaling_config.value.system_disk_type
      system_disk_size           = auto_scaling_config.value.system_disk_size
      orderly_security_group_ids = concat([tencentcloud_security_group.node_security_group.id], auto_scaling_config.value.security_group_ids)
      key_ids                    = auto_scaling_config.value.key_ids
    }
  }

  labels = each.value.labels

  tags = {
    team        = var.label_team
    environment = var.label_environment
  }

  dynamic "taints" {
    for_each = each.value.taints
    content {
      key    = taints.value.key
      value  = taints.value.value
      effect = taints.value.effect
    }
  }

  lifecycle {
    ignore_changes = [
      desired_capacity,
    ]
  }
}

resource "tencentcloud_security_group" "control_plane_security_group" {
  name = "tke-control-plane-${var.cluster_name}-sg"
}

resource "tencentcloud_security_group_rule_set" "control_plane_security_group" {
  security_group_id = tencentcloud_security_group.control_plane_security_group.id

  dynamic "ingress" {
    for_each = var.cluster_internet_access_additional_ingress_rules
    content {
      action      = ingress.value.action
      cidr_block  = ingress.value.cidr_block
      protocol    = ingress.value.protocol
      port        = ingress.value.port
      description = ingress.key
    }
  }

  ingress {
    action      = "DROP"
    cidr_block  = "0.0.0.0/0"
    protocol    = "ALL"
    port        = "ALL"
    description = "D:Drop ALL"
  }

  egress {
    action      = "ACCEPT"
    cidr_block  = "0.0.0.0/0"
    protocol    = "ALL"
    port        = "ALL"
    description = "D:Allow ALL"
  }
}

resource "tencentcloud_kubernetes_cluster_endpoint" "endpoints" {
  cluster_id = tencentcloud_kubernetes_cluster.cluster.id

  cluster_internet = var.enable_internet_access
  cluster_intranet = var.enable_intranet_access

  cluster_internet_security_group = var.enable_internet_access ? tencentcloud_security_group.control_plane_security_group.id : null
  cluster_intranet_subnet_id      = var.enable_intranet_access ? var.cluster_intranet_access_load_balancer_subnet_id : null

  depends_on = [
    tencentcloud_kubernetes_node_pool.node_pool
  ]
}