module "tencent_k8s" {
  source = "../"

  vpc_id = "vpc-4onnpmka"

  cluster_name    = "s-id-em-tke-01"
  cluster_version = "1.28.3"
  cluster_os      = "tlinux3.1x86_64"
  cluster_level   = "L5"

  container_runtime = "containerd"
  runtime_version   = "1.6.9"

  pod_ip_subnet_ids = [
    "subnet-c53rhgul",
    "subnet-dwqerthh",
  ]
  service_ip_cidr              = "172.16.0.0/20"
  cluster_max_service_num      = 4096
  ignore_cluster_cidr_conflict = true
  max_pod_per_node             = 128

  deletion_protection              = false
  upgrade_instances_follow_cluster = true

  label_environment = "staging"
  label_team        = "emoney"
}