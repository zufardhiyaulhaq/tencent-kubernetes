## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | 1.81.111 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | 1.81.111 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_kubernetes_cluster.cluster](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/kubernetes_cluster) | resource |
| [tencentcloud_kubernetes_cluster_endpoint.endpoints](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/kubernetes_cluster_endpoint) | resource |
| [tencentcloud_kubernetes_node_pool.node_pool](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/kubernetes_node_pool) | resource |
| [tencentcloud_security_group.control_plane_security_group](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/security_group) | resource |
| [tencentcloud_security_group.node_security_group](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/security_group) | resource |
| [tencentcloud_security_group_rule_set.control_plane_security_group](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/security_group_rule_set) | resource |
| [tencentcloud_security_group_rule_set.node_security_group](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/1.81.111/docs/resources/security_group_rule_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_internet_access_additional_ingress_rules"></a> [cluster\_internet\_access\_additional\_ingress\_rules](#input\_cluster\_internet\_access\_additional\_ingress\_rules) | n/a | <pre>map(object({<br>    action     = string<br>    protocol   = string<br>    port       = string<br>    cidr_block = string<br>  }))</pre> | n/a | yes |
| <a name="input_cluster_intranet_access_load_balancer_subnet_id"></a> [cluster\_intranet\_access\_load\_balancer\_subnet\_id](#input\_cluster\_intranet\_access\_load\_balancer\_subnet\_id) | Cluster private access subnet id. | `string` | n/a | yes |
| <a name="input_cluster_level"></a> [cluster\_level](#input\_cluster\_level) | Cluster level. | `string` | `"L5"` | no |
| <a name="input_cluster_max_service_num"></a> [cluster\_max\_service\_num](#input\_cluster\_max\_service\_num) | Cluster max service number. | `number` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | TKE managed cluster name. | `string` | n/a | yes |
| <a name="input_cluster_os"></a> [cluster\_os](#input\_cluster\_os) | Cluster os. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Cluster kubernetes version. | `string` | n/a | yes |
| <a name="input_container_runtime"></a> [container\_runtime](#input\_container\_runtime) | Container runtime. | `string` | `"containerd"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Cluster deletion protection. | `bool` | `true` | no |
| <a name="input_enable_internet_access"></a> [enable\_internet\_access](#input\_enable\_internet\_access) | Enable internet access. | `bool` | `false` | no |
| <a name="input_enable_intranet_access"></a> [enable\_intranet\_access](#input\_enable\_intranet\_access) | Enable intranet access. | `bool` | `false` | no |
| <a name="input_ignore_cluster_cidr_conflict"></a> [ignore\_cluster\_cidr\_conflict](#input\_ignore\_cluster\_cidr\_conflict) | Ignore cluster cidr conflict. | `bool` | `true` | no |
| <a name="input_label_environment"></a> [label\_environment](#input\_label\_environment) | Enviroment label | `string` | n/a | yes |
| <a name="input_label_team"></a> [label\_team](#input\_label\_team) | Team label | `string` | n/a | yes |
| <a name="input_max_pod_per_node"></a> [max\_pod\_per\_node](#input\_max\_pod\_per\_node) | Cluster max pod per node number. | `number` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | nodepool configuration. | <pre>map(object({<br>    enable_autoscaling       = bool<br>    max_capacity             = number<br>    min_capacity             = number<br>    desired_capacity         = number<br>    node_subnet_ids          = list(string)<br>    retry_policy             = string<br>    multi_zone_subnet_policy = string<br>    auto_scaling_config = map(object({<br>      instance_type      = string<br>      system_disk_type   = string<br>      system_disk_size   = number<br>      security_group_ids = list(string)<br>      key_ids            = list(string)<br>    }))<br>    taints = map(object({<br>      key    = string<br>      value  = string<br>      effect = string<br>    }))<br>    labels = map(string)<br><br>    delete_keep_instance = optional(bool, false)<br>    deletion_protection  = optional(bool, false)<br>    termination_policies = optional(list(string), ["NEWEST_INSTANCE"])<br>  }))</pre> | n/a | yes |
| <a name="input_pod_ip_subnet_ids"></a> [pod\_ip\_subnet\_ids](#input\_pod\_ip\_subnet\_ids) | Cluster of Pods | `list(string)` | n/a | yes |
| <a name="input_runtime_version"></a> [runtime\_version](#input\_runtime\_version) | Container runtime version. | `string` | `"1.6.9"` | no |
| <a name="input_service_ip_cidr"></a> [service\_ip\_cidr](#input\_service\_ip\_cidr) | Cluster service ip range. | `string` | n/a | yes |
| <a name="input_upgrade_instances_follow_cluster"></a> [upgrade\_instances\_follow\_cluster](#input\_upgrade\_instances\_follow\_cluster) | Indicates whether upgrade all instances when cluster\_version change. | `bool` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC | `string` | n/a | yes |

## Outputs

No outputs.
