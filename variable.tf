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