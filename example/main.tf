module "tencent_k8s" {
  source = "../"

  vpc_id = "vpc-emzjekrg"

  cluster_name    = "s-id-em-tke-01"
  cluster_version = "1.28.3"
  cluster_os      = "tlinux3.1x86_64"
  cluster_level   = "L5"

  container_runtime = "containerd"
  runtime_version   = "1.6.9"

  pod_ip_subnet_ids = [
    "subnet-lc476ep7",
    "subnet-no7xqkbz",
  ]
  service_ip_cidr              = "172.16.0.0/20"
  cluster_max_service_num      = 4096
  ignore_cluster_cidr_conflict = true
  max_pod_per_node             = 128

  deletion_protection              = false
  upgrade_instances_follow_cluster = true

  label_environment = "staging"
  label_team        = "emoney"

  node_pools = {
    "nodepool-01" = {
      enable_autoscaling = true
      max_capacity       = 2
      min_capacity       = 1
      desired_capacity   = 1

      node_subnet_ids = [
        "subnet-esjs1ytj",
        "subnet-i1gjdjfn",
      ]
      retry_policy             = "INCREMENTAL_INTERVALS"
      multi_zone_subnet_policy = "PRIORITY"

      auto_scaling_config = {
        "type-1" = {
          instance_type              = "S5.LARGE8"
          system_disk_type           = "CLOUD_PREMIUM"
          system_disk_size           = 50
          security_group_ids         = []
          key_ids                    = ["skey-gv2lvrtn"]
          internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
          internet_max_bandwidth_out = 100
        }
      }

      labels = {
        "team"        = "emoney"
        "environment" = "staging"
      }

      taints = {}
    }
  }

  enable_internet_access                          = true
  enable_intranet_access                          = true
  cluster_intranet_access_load_balancer_subnet_id = "subnet-esjs1ytj"
  cluster_internet_access_additional_ingress_rules = {
    "allow-all" = {
      protocol   = "TCP"
      port       = "443"
      cidr_block = "0.0.0.0/0"
      action     = "ACCEPT"
    }
  }
}

module "tencent_k8s_public" {
  source = "../"

  vpc_id = "vpc-emzjekrg"

  cluster_name    = "s-id-em-public-tke-01"
  cluster_version = "1.28.3"
  cluster_os      = "tlinux3.1x86_64"
  cluster_level   = "L5"

  container_runtime = "containerd"
  runtime_version   = "1.6.9"

  pod_ip_subnet_ids = [
    "subnet-9id7436v",
    "subnet-9hdikfph",
  ]
  service_ip_cidr              = "172.17.0.0/20"
  cluster_max_service_num      = 4096
  ignore_cluster_cidr_conflict = true
  max_pod_per_node             = 128

  deletion_protection              = false
  upgrade_instances_follow_cluster = true

  label_environment = "staging"
  label_team        = "emoney"

  node_pools = {
    "nodepool-01" = {
      enable_autoscaling = true
      max_capacity       = 2
      min_capacity       = 1
      desired_capacity   = 1

      node_subnet_ids = [
        "subnet-6rq8y38n",
        "subnet-76tbdwhx",
      ]
      retry_policy             = "INCREMENTAL_INTERVALS"
      multi_zone_subnet_policy = "PRIORITY"

      auto_scaling_config = {
        "type-1" = {
          instance_type              = "S5.LARGE8"
          system_disk_type           = "CLOUD_PREMIUM"
          system_disk_size           = 50
          security_group_ids         = []
          key_ids                    = ["skey-gv2lvrtn"]
          internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
          internet_max_bandwidth_out = 100
        }
      }

      labels = {
        "team"        = "emoney"
        "environment" = "staging"
      }

      taints = {}
    }
  }

  enable_internet_access                          = true
  enable_intranet_access                          = true
  cluster_intranet_access_load_balancer_subnet_id = "subnet-6rq8y38n"
  cluster_internet_access_additional_ingress_rules = {
    "allow-all" = {
      protocol   = "TCP"
      port       = "443"
      cidr_block = "0.0.0.0/0"
      action     = "ACCEPT"
    }
  }
}

module "tencent_k8s_utility" {
  source = "../"

  vpc_id = "vpc-emzjekrg"

  cluster_name    = "s-id-em-utility-tke-01"
  cluster_version = "1.28.3"
  cluster_os      = "tlinux3.1x86_64"
  cluster_level   = "L5"

  container_runtime = "containerd"
  runtime_version   = "1.6.9"

  pod_ip_subnet_ids = [
    "subnet-iauvjedr",
    "subnet-hbcu019n",
  ]
  service_ip_cidr              = "172.18.0.0/20"
  cluster_max_service_num      = 4096
  ignore_cluster_cidr_conflict = true
  max_pod_per_node             = 128

  deletion_protection              = false
  upgrade_instances_follow_cluster = true

  label_environment = "staging"
  label_team        = "emoney"

  node_pools = {
    "nodepool-01" = {
      enable_autoscaling = true
      max_capacity       = 2
      min_capacity       = 1
      desired_capacity   = 1

      node_subnet_ids = [
        "subnet-24ybv7cz",
        "subnet-m11ns82z",
      ]
      retry_policy             = "INCREMENTAL_INTERVALS"
      multi_zone_subnet_policy = "PRIORITY"

      auto_scaling_config = {
        "type-1" = {
          instance_type              = "S5.LARGE8"
          system_disk_type           = "CLOUD_PREMIUM"
          system_disk_size           = 50
          security_group_ids         = []
          key_ids                    = ["skey-gv2lvrtn"]
          internet_charge_type       = "TRAFFIC_POSTPAID_BY_HOUR"
          internet_max_bandwidth_out = 100
        }
      }

      labels = {
        "team"        = "emoney"
        "environment" = "staging"
      }

      taints = {}
    }
  }

  enable_internet_access                          = true
  enable_intranet_access                          = true
  cluster_intranet_access_load_balancer_subnet_id = "subnet-24ybv7cz"
  cluster_internet_access_additional_ingress_rules = {
    "allow-all" = {
      protocol   = "TCP"
      port       = "443"
      cidr_block = "0.0.0.0/0"
      action     = "ACCEPT"
    }
  }
}