<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_alb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_appautoscaling_policy.down](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.up](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_service.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ignore_changes_desired_count](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ignore_changes_task_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_service.ignore_changes_task_definition_and_desired_count](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.ecs_ssm_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb_listener_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_certificate) | resource |
| [aws_lb_listener_rule.http_tcp_listener_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_listener_rule.https_listener_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_security_group.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_all_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.allow_icmp_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_cluster) | data source |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_task_definition) | data source |
| [aws_iam_policy_document.ecs_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_ssm_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_task_exec](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_security_group"></a> [alb\_security\_group](#input\_alb\_security\_group) | Security group of the ALB | `string` | `""` | no |
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Assign a public IP address to the ENI (Fargate launch type only). Valid values are `true` or `false`. Default `false` | `bool` | `false` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `false` | no |
| <a name="input_capacity_provider_strategies"></a> [capacity\_provider\_strategies](#input\_capacity\_provider\_strategies) | The capacity provider strategies to use for the service. See `capacity_provider_strategy` configuration block: https://www.terraform.io/docs/providers/aws/r/ecs_service.html#capacity_provider_strategy | `list(any)` | `[]` | no |
| <a name="input_circuit_breaker_deployment_enabled"></a> [circuit\_breaker\_deployment\_enabled](#input\_circuit\_breaker\_deployment\_enabled) | If `true`, enable the deployment circuit breaker logic for the service | `bool` | `false` | no |
| <a name="input_circuit_breaker_rollback_enabled"></a> [circuit\_breaker\_rollback\_enabled](#input\_circuit\_breaker\_rollback\_enabled) | If `true`, Amazon ECS will roll back the service if a service deployment fails | `bool` | `false` | no |
| <a name="input_container_definition_json"></a> [container\_definition\_json](#input\_container\_definition\_json) | A string containing a JSON-encoded array of container definitions<br>(`"[{ "name": "container1", ... }, { "name": "container2", ... }]"`).<br>See [API\_ContainerDefinition](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html),<br>[cloudposse/terraform-aws-ecs-container-definition](https://github.com/cloudposse/terraform-aws-ecs-container-definition), or<br>[ecs\_task\_definition#container\_definitions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#container_definitions) | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port on the container to allow traffic from the ALB security group | `number` | `8080` | no |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | (Optional) Number of cpu units used by the task. If the requires\_compatibilities is FARGATE this field is required. | `number` | `null` | no |
| <a name="input_deployment_controller_type"></a> [deployment\_controller\_type](#input\_deployment\_controller\_type) | Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS` | `string` | `"ECS"` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment | `number` | `200` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment | `number` | `100` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The number of instances of the task definition to place and keep running | `number` | `1` | no |
| <a name="input_docker_volumes"></a> [docker\_volumes](#input\_docker\_volumes) | Task docker volume definitions as list of configuration objects. You cannot define both Docker volumes and EFS volumes on the same task definition. | <pre>list(object({<br>    host_path = string<br>    name      = string<br>    docker_volume_configuration = list(object({<br>      autoprovision = bool<br>      driver        = string<br>      driver_opts   = map(string)<br>      labels        = map(string)<br>      scope         = string<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | The ARN of the ECS cluster where service will be provisioned | `string` | n/a | yes |
| <a name="input_efs_volumes"></a> [efs\_volumes](#input\_efs\_volumes) | Task EFS volume definitions as list of configuration objects. You cannot define both Docker volumes and EFS volumes on the same task definition. | <pre>list(object({<br>    host_path = string<br>    name      = string<br>    efs_volume_configuration = list(object({<br>      file_system_id          = string<br>      root_directory          = string<br>      transit_encryption      = string<br>      transit_encryption_port = string<br>      authorization_config = list(object({<br>        access_point_id = string<br>        iam             = string<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_enable_all_egress_rule"></a> [enable\_all\_egress\_rule](#input\_enable\_all\_egress\_rule) | A flag to enable/disable adding the all ports egress rule to the service security group | `bool` | `true` | no |
| <a name="input_enable_ecs_managed_tags"></a> [enable\_ecs\_managed\_tags](#input\_enable\_ecs\_managed\_tags) | Specifies whether to enable Amazon ECS managed tags for the tasks within the service | `bool` | `false` | no |
| <a name="input_enable_icmp_rule"></a> [enable\_icmp\_rule](#input\_enable\_icmp\_rule) | Specifies whether to enable ICMP on the service security group | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment. | `string` | n/a | yes |
| <a name="input_ephemeral_storage_size"></a> [ephemeral\_storage\_size](#input\_ephemeral\_storage\_size) | The number of GBs to provision for ephemeral storage on Fargate tasks. Must be greater than or equal to 21 and less than or equal to 200 | `number` | `0` | no |
| <a name="input_exec_enabled"></a> [exec\_enabled](#input\_exec\_enabled) | Specifies whether to enable Amazon ECS Exec for the tasks within the service | `bool` | `false` | no |
| <a name="input_force_new_deployment"></a> [force\_new\_deployment](#input\_force\_new\_deployment) | Enable to force a new task deployment of the service. | `bool` | `false` | no |
| <a name="input_health_check_grace_period_seconds"></a> [health\_check\_grace\_period\_seconds](#input\_health\_check\_grace\_period\_seconds) | Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers | `number` | `0` | no |
| <a name="input_http_listener_rules"></a> [http\_listener\_rules](#input\_http\_listener\_rules) | A list of maps describing the HTTP Listener Rules. | `any` | `[]` | no |
| <a name="input_https_listener_certificates"></a> [https\_listener\_certificates](#input\_https\_listener\_certificates) | A list of maps describing SSL certificates to apply to the HTTPS listeners | `list(map(string))` | `[]` | no |
| <a name="input_https_listener_rules"></a> [https\_listener\_rules](#input\_https\_listener\_rules) | A list of maps describing the HTTPS Listener Rules. | `any` | `[]` | no |
| <a name="input_ignore_changes_desired_count"></a> [ignore\_changes\_desired\_count](#input\_ignore\_changes\_desired\_count) | Whether to ignore changes for desired count in the ECS service | `bool` | `false` | no |
| <a name="input_ignore_changes_task_definition"></a> [ignore\_changes\_task\_definition](#input\_ignore\_changes\_task\_definition) | Whether to ignore changes in container definition and task definition in the ECS service | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS customer managed key (CMK) ARN for encrypting application logs. | `string` | `null` | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | The launch type on which to run your service. Valid values are `EC2`, `FARGATE` and `EXTERNAL` | `string` | `"EC2"` | no |
| <a name="input_load_balancers"></a> [load\_balancers](#input\_load\_balancers) | A list of load balancer config objects for the ECS service; see [ecs\_service#load\_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#load_balancer) docs | `any` | `[]` | no |
| <a name="input_logs_cloudwatch_group"></a> [logs\_cloudwatch\_group](#input\_logs\_cloudwatch\_group) | CloudWatch log group to create and use. Default: /aws/ecs/{ecs\_cluster\_name}/logs/{name}/{environment} | `string` | `""` | no |
| <a name="input_logs_cloudwatch_retention"></a> [logs\_cloudwatch\_retention](#input\_logs\_cloudwatch\_retention) | Number of days you want to retain log events in the log group. | `number` | `90` | no |
| <a name="input_max_capacity"></a> [max\_capacity](#input\_max\_capacity) | Maximum number of running instances of a Service | `number` | `2` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | (Optional) Amount (in MiB) of memory used by the task. If the requires\_compatibilities is FARGATE this field is required. | `number` | `null` | no |
| <a name="input_min_capacity"></a> [min\_capacity](#input\_min\_capacity) | Minimum number of running instances of a Service | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | The service name. | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type` or `null` for `EC2` `launch_type` | `string` | `"awsvpc"` | no |
| <a name="input_nlb_cidr_blocks"></a> [nlb\_cidr\_blocks](#input\_nlb\_cidr\_blocks) | A list of CIDR blocks to add to the ingress rule for the NLB container port | `list(string)` | `[]` | no |
| <a name="input_nlb_container_port"></a> [nlb\_container\_port](#input\_nlb\_container\_port) | The port on the container to allow traffic from the NLB | `number` | `8080` | no |
| <a name="input_ordered_placement_strategy"></a> [ordered\_placement\_strategy](#input\_ordered\_placement\_strategy) | Service level strategy rules that are taken into consideration during task placement.<br>List from top to bottom in order of precedence. The maximum number of ordered\_placement\_strategy blocks is 5.<br>See [`ordered_placement_strategy`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#ordered_placement_strategy) | <pre>list(object({<br>    type  = string<br>    field = string<br>  }))</pre> | `[]` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | A permissions boundary ARN to apply to the 3 roles that are created. | `string` | `""` | no |
| <a name="input_platform_version"></a> [platform\_version](#input\_platform\_version) | The platform version on which to run your service. Only applicable for `launch_type` set to `FARGATE`.<br>More information about Fargate platform versions can be found in the AWS ECS User Guide. | `string` | `"LATEST"` | no |
| <a name="input_propagate_tags"></a> [propagate\_tags](#input\_propagate\_tags) | Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK\_DEFINITION | `string` | `null` | no |
| <a name="input_proxy_configuration"></a> [proxy\_configuration](#input\_proxy\_configuration) | The proxy configuration details for the App Mesh proxy. See `proxy_configuration` docs https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#proxy-configuration-arguments | <pre>object({<br>    type           = string<br>    container_name = string<br>    properties     = map(string)<br>  })</pre> | `null` | no |
| <a name="input_role_tags_enabled"></a> [role\_tags\_enabled](#input\_role\_tags\_enabled) | Enable/disable tags on ECS roles | `string` | `true` | no |
| <a name="input_runtime_platform"></a> [runtime\_platform](#input\_runtime\_platform) | Zero or one runtime platform configurations that containers in your task may use.<br>Map of strings with optional keys `operating_system_family` and `cpu_architecture`.<br>See `runtime_platform` docs https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#runtime_platform | `list(map(string))` | `[]` | no |
| <a name="input_scale_down_adjustment"></a> [scale\_down\_adjustment](#input\_scale\_down\_adjustment) | Scaling adjustment to make during scale down event | `number` | `-1` | no |
| <a name="input_scale_down_cooldown"></a> [scale\_down\_cooldown](#input\_scale\_down\_cooldown) | Period (in seconds) to wait between scale down events | `number` | `300` | no |
| <a name="input_scale_up_adjustment"></a> [scale\_up\_adjustment](#input\_scale\_up\_adjustment) | Scaling adjustment to make during scale up event | `number` | `1` | no |
| <a name="input_scale_up_cooldown"></a> [scale\_up\_cooldown](#input\_scale\_up\_cooldown) | Period (in seconds) to wait between scale up events | `number` | `60` | no |
| <a name="input_scheduling_strategy"></a> [scheduling\_strategy](#input\_scheduling\_strategy) | The scheduling strategy to use for the service. The valid values are `REPLICA` and `DAEMON`.<br>Note that Fargate tasks do not support the DAEMON scheduling strategy. | `string` | `"REPLICA"` | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The description to assign to the service security group.<br>Warning: Changing the description causes the security group to be replaced. | `string` | `"Allow ALL egress from ECS service"` | no |
| <a name="input_security_group_enabled"></a> [security\_group\_enabled](#input\_security\_group\_enabled) | Whether to create a security group for the service. | `bool` | `true` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group IDs to allow in Service `network_configuration` if `var.network_mode = "awsvpc"` | `list(string)` | `[]` | no |
| <a name="input_service_placement_constraints"></a> [service\_placement\_constraints](#input\_service\_placement\_constraints) | The rules that are taken into consideration during task placement. Maximum number of placement\_constraints is 10. See [`placement_constraints`](https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1) docs | <pre>list(object({<br>    type       = string<br>    expression = string<br>  }))</pre> | `[]` | no |
| <a name="input_service_registries"></a> [service\_registries](#input\_service\_registries) | Zero or one service discovery registries for the service.<br>The currently supported service registry is Amazon Route 53 Auto Naming Service - `aws_service_discovery_service`;<br>see `service_registries` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1"<br>Service registry is object with required key `registry_arn = string` and optional keys<br>  `port           = number`<br>  `container_name = string`<br>  `container_port = number` | `list(any)` | `[]` | no |
| <a name="input_service_role_arn"></a> [service\_role\_arn](#input\_service\_role\_arn) | ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here. | `string` | `null` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs used in Service `network_configuration` if `var.network_mode = "awsvpc"` | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional Tags | `map(string)` | `{}` | no |
| <a name="input_target_group"></a> [target\_group](#input\_target\_group) | (Optional) Provides a Target Group resource for use with Load Balancer resources. | `any` | `{}` | no |
| <a name="input_task_definition"></a> [task\_definition](#input\_task\_definition) | Reuse an existing task definition family and revision for the ecs service instead of creating one | `string` | `null` | no |
| <a name="input_task_exec_policy_arns"></a> [task\_exec\_policy\_arns](#input\_task\_exec\_policy\_arns) | A list of IAM Policy ARNs to attach to the generated task execution role. | `list(string)` | `[]` | no |
| <a name="input_task_exec_role_arn"></a> [task\_exec\_role\_arn](#input\_task\_exec\_role\_arn) | A `list(string)` of zero or one ARNs of IAM roles that allows the<br>ECS/Fargate agent to make calls to the ECS API on your behalf.<br>If the list is empty, a role will be created for you.<br>DEPRECATED: you can also pass a `string` with the ARN, but that<br>string must be known a "plan" time. | `any` | `[]` | no |
| <a name="input_task_placement_constraints"></a> [task\_placement\_constraints](#input\_task\_placement\_constraints) | A set of placement constraints rules that are taken into consideration during task placement.<br>Maximum number of placement\_constraints is 10. See [`placement_constraints`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#placement-constraints-arguments) | <pre>list(object({<br>    type       = string<br>    expression = string<br>  }))</pre> | `[]` | no |
| <a name="input_task_policy_arns"></a> [task\_policy\_arns](#input\_task\_policy\_arns) | A list of IAM Policy ARNs to attach to the generated task role. | `list(string)` | `[]` | no |
| <a name="input_task_role_arn"></a> [task\_role\_arn](#input\_task\_role\_arn) | A `list(string)` of zero or one ARNs of IAM roles that allows<br>your Amazon ECS container task to make calls to other AWS services.<br>If the list is empty, a role will be created for you.<br>DEPRECATED: you can also pass a `string` with the ARN, but that<br>string must be known a "plan" time. | `any` | `[]` | no |
| <a name="input_use_alb_security_group"></a> [use\_alb\_security\_group](#input\_use\_alb\_security\_group) | A flag to enable/disable allowing traffic from the ALB security group to the service security group | `bool` | `false` | no |
| <a name="input_use_nlb_cidr_blocks"></a> [use\_nlb\_cidr\_blocks](#input\_use\_nlb\_cidr\_blocks) | A flag to enable/disable adding the NLB ingress rule to the service security group | `bool` | `false` | no |
| <a name="input_use_old_arn"></a> [use\_old\_arn](#input\_use\_old\_arn) | A flag to enable/disable tagging the ecs resources that require the new arn format | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID where resources are created | `string` | n/a | yes |
| <a name="input_wait_for_steady_state"></a> [wait\_for\_steady\_state](#input\_wait\_for\_steady\_state) | If true, it will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_target_group_arn"></a> [alb\_target\_group\_arn](#output\_alb\_target\_group\_arn) | ECS task definition family |
| <a name="output_ecs_exec_role_policy_id"></a> [ecs\_exec\_role\_policy\_id](#output\_ecs\_exec\_role\_policy\_id) | The ECS service role policy ID, in the form of `role_name:role_policy_name` |
| <a name="output_ecs_exec_role_policy_name"></a> [ecs\_exec\_role\_policy\_name](#output\_ecs\_exec\_role\_policy\_name) | ECS service role name |
| <a name="output_scale_down_policy_arn"></a> [scale\_down\_policy\_arn](#output\_scale\_down\_policy\_arn) | ARN of the scale down policy |
| <a name="output_scale_up_policy_arn"></a> [scale\_up\_policy\_arn](#output\_scale\_up\_policy\_arn) | ARN of the scale up policy |
| <a name="output_service_arn"></a> [service\_arn](#output\_service\_arn) | ECS Service ARN |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | ECS Service name |
| <a name="output_service_role_arn"></a> [service\_role\_arn](#output\_service\_role\_arn) | ECS Service role ARN |
| <a name="output_service_security_group_id"></a> [service\_security\_group\_id](#output\_service\_security\_group\_id) | Security Group ID of the ECS task |
| <a name="output_task_definition_arn"></a> [task\_definition\_arn](#output\_task\_definition\_arn) | ECS task definition ARN |
| <a name="output_task_definition_family"></a> [task\_definition\_family](#output\_task\_definition\_family) | ECS task definition family |
| <a name="output_task_definition_revision"></a> [task\_definition\_revision](#output\_task\_definition\_revision) | ECS task definition revision |
| <a name="output_task_exec_role_arn"></a> [task\_exec\_role\_arn](#output\_task\_exec\_role\_arn) | ECS Task exec role ARN |
| <a name="output_task_exec_role_id"></a> [task\_exec\_role\_id](#output\_task\_exec\_role\_id) | ECS Task exec role id |
| <a name="output_task_exec_role_name"></a> [task\_exec\_role\_name](#output\_task\_exec\_role\_name) | ECS Task role name |
| <a name="output_task_role_arn"></a> [task\_role\_arn](#output\_task\_role\_arn) | ECS Task role ARN |
| <a name="output_task_role_id"></a> [task\_role\_id](#output\_task\_role\_id) | ECS Task role id |
| <a name="output_task_role_name"></a> [task\_role\_name](#output\_task\_role\_name) | ECS Task role name |
<!-- END_TF_DOCS -->