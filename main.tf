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
      cluster_level
    ]
  }
}