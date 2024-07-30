variable "label_environment" {
  description = "Enviroment label"
  type        = string
}

variable "label_team" {
  description = "Team label"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "cluster_name" {
  type        = string
  description = "TKE managed cluster name."
}

variable "cluster_version" {
  type        = string
  description = "Cluster kubernetes version."
}

variable "cluster_os" {
  type        = string
  description = "Cluster os."
}

variable "service_ip_cidr" {
  type        = string
  description = "Cluster service ip range."
}

variable "pod_ip_subnet_ids" {
  type        = list(string)
  description = "Cluster of Pods"
}

variable "max_pod_per_node" {
  type        = number
  description = "Cluster max pod per node number."
}

variable "cluster_level" {
  type        = string
  description = "Cluster level."
  default     = "L5"
}

variable "deletion_protection" {
  type        = bool
  description = "Cluster deletion protection."
  default     = true
}

variable "container_runtime" {
  type        = string
  description = "Container runtime."
  default     = "containerd"
}

variable "runtime_version" {
  type        = string
  description = "Container runtime version."
  default     = "1.6.9"
}

variable "upgrade_instances_follow_cluster" {
  type        = bool
  description = "Indicates whether upgrade all instances when cluster_version change."
}

variable "cluster_max_service_num" {
  type        = number
  description = "Cluster max service number."
}

variable "ignore_cluster_cidr_conflict" {
  type        = bool
  description = "Ignore cluster cidr conflict."
  default     = true
}

variable "node_pools" {
  type = map(object({
    enable_autoscaling       = bool
    max_capacity             = number
    min_capacity             = number
    desired_capacity         = number
    node_subnet_ids          = list(string)
    retry_policy             = string
    multi_zone_subnet_policy = string
    auto_scaling_config = map(object({
      instance_type      = string
      system_disk_type   = string
      system_disk_size   = number
      security_group_ids = list(string)
      key_ids            = list(string)
    }))
    taints = map(object({
      key    = string
      value  = string
      effect = string
    }))
    labels = map(string)
  }))

  description = "nodepool configuration."
}

variable "enable_internet_access" {
  type        = bool
  description = "Enable internet access."
  default     = false
}

variable "enable_intranet_access" {
  type        = bool
  description = "Enable intranet access."
  default     = false
}

variable "cluster_intranet_access_load_balancer_subnet_id" {
  type        = string
  description = "Cluster private access subnet id."
}

variable "cluster_internet_access_additional_ingress_rules" {
  type = map(object({
    action     = string
    protocol   = string
    port       = string
    cidr_block = string
  }))
}