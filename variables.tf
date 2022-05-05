variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "name" {
  description = "The service name."
  type        = string
}

variable "environment" {
  description = "The environment."
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Additional Tags"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID where resources are created"
}

variable "ecs_cluster_name" {
  type        = string
  description = "The ARN of the ECS cluster where service will be provisioned"
}

variable "load_balancers" {
  type        = any
  description = "A list of load balancer config objects for the ECS service; see [ecs_service#load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#load_balancer) docs"
  default     = []
}

variable "container_definition_json" {
  type        = string
  description = <<-EOT
    A string containing a JSON-encoded array of container definitions
    (`"[{ "name": "container1", ... }, { "name": "container2", ... }]"`).
    See [API_ContainerDefinition](https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html),
    [cloudposse/terraform-aws-ecs-container-definition](https://github.com/cloudposse/terraform-aws-ecs-container-definition), or
    [ecs_task_definition#container_definitions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#container_definitions)
    EOT
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs used in Service `network_configuration` if `var.network_mode = \"awsvpc\"`"
  default     = null
}

variable "security_group_enabled" {
  type        = bool
  description = "Whether to create a security group for the service."
  default     = true
}

variable "security_group_description" {
  type        = string
  default     = "Allow ALL egress from ECS service"
  description = <<-EOT
    The description to assign to the service security group.
    Warning: Changing the description causes the security group to be replaced.
    EOT
}

variable "enable_all_egress_rule" {
  type        = bool
  description = "A flag to enable/disable adding the all ports egress rule to the service security group"
  default     = true
}

variable "enable_icmp_rule" {
  type        = bool
  description = "Specifies whether to enable ICMP on the service security group"
  default     = false
}

variable "use_alb_security_group" {
  type        = bool
  description = "A flag to enable/disable allowing traffic from the ALB security group to the service security group"
  default     = false
}

variable "alb_security_group" {
  type        = string
  description = "Security group of the ALB"
  default     = ""
}

variable "container_port" {
  type        = number
  description = "The port on the container to allow traffic from the ALB security group"
  default     = 8080
}

variable "use_nlb_cidr_blocks" {
  type        = bool
  description = "A flag to enable/disable adding the NLB ingress rule to the service security group"
  default     = false
}

variable "nlb_container_port" {
  type        = number
  description = "The port on the container to allow traffic from the NLB"
  default     = 8080
}

variable "nlb_cidr_blocks" {
  type        = list(string)
  description = "A list of CIDR blocks to add to the ingress rule for the NLB container port"
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs to allow in Service `network_configuration` if `var.network_mode = \"awsvpc\"`"
  type        = list(string)
  default     = []
}

variable "launch_type" {
  type        = string
  description = "The launch type on which to run your service. Valid values are `EC2`, `FARGATE` and `EXTERNAL`"
  default     = "EC2"
}

variable "platform_version" {
  type        = string
  default     = "LATEST"
  description = <<-EOT
    The platform version on which to run your service. Only applicable for `launch_type` set to `FARGATE`.
    More information about Fargate platform versions can be found in the AWS ECS User Guide.
    EOT
}

variable "scheduling_strategy" {
  type        = string
  default     = "REPLICA"
  description = <<-EOT
    The scheduling strategy to use for the service. The valid values are `REPLICA` and `DAEMON`.
    Note that Fargate tasks do not support the DAEMON scheduling strategy.
    EOT
}

variable "ordered_placement_strategy" {
  type = list(object({
    type  = string
    field = string
  }))
  default     = []
  description = <<-EOT
    Service level strategy rules that are taken into consideration during task placement.
    List from top to bottom in order of precedence. The maximum number of ordered_placement_strategy blocks is 5.
    See [`ordered_placement_strategy`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#ordered_placement_strategy)
    EOT
}

variable "task_placement_constraints" {
  type = list(object({
    type       = string
    expression = string
  }))
  default     = []
  description = <<-EOT
    A set of placement constraints rules that are taken into consideration during task placement.
    Maximum number of placement_constraints is 10. See [`placement_constraints`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#placement-constraints-arguments)
    EOT
}

variable "service_placement_constraints" {
  type = list(object({
    type       = string
    expression = string
  }))
  description = "The rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. See [`placement_constraints`](https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1) docs"
  default     = []
}

variable "network_mode" {
  type        = string
  description = "The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type` or `null` for `EC2` `launch_type`"
  default     = "awsvpc"
}

variable "task_exec_role_arn" {
  type        = any
  description = <<-EOT
    A `list(string)` of zero or one ARNs of IAM roles that allows the
    ECS/Fargate agent to make calls to the ECS API on your behalf.
    If the list is empty, a role will be created for you.
    DEPRECATED: you can also pass a `string` with the ARN, but that
    string must be known a "plan" time.
    EOT
  default     = []
}

variable "task_exec_policy_arns" {
  type        = list(string)
  description = "A list of IAM Policy ARNs to attach to the generated task execution role."
  default     = []
}

variable "task_role_arn" {
  type        = any
  description = <<-EOT
    A `list(string)` of zero or one ARNs of IAM roles that allows
    your Amazon ECS container task to make calls to other AWS services.
    If the list is empty, a role will be created for you.
    DEPRECATED: you can also pass a `string` with the ARN, but that
    string must be known a "plan" time.
    EOT
  default     = []
}

variable "task_policy_arns" {
  type        = list(string)
  description = "A list of IAM Policy ARNs to attach to the generated task role."
  default     = []
}

variable "service_role_arn" {
  type        = string
  description = "ARN of the IAM role that allows Amazon ECS to make calls to your load balancer on your behalf. This parameter is required if you are using a load balancer with your service, but only if your task definition does not use the awsvpc network mode. If using awsvpc network mode, do not specify this role. If your account has already created the Amazon ECS service-linked role, that role is used by default for your service unless you specify a role here."
  default     = null
}

variable "desired_count" {
  type        = number
  description = "The number of instances of the task definition to place and keep running"
  default     = 1
}

variable "deployment_controller_type" {
  type        = string
  description = "Type of deployment controller. Valid values are `CODE_DEPLOY` and `ECS`"
  default     = "ECS"
}

variable "deployment_maximum_percent" {
  type        = number
  description = "The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment"
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  type        = number
  description = "The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment"
  default     = 100
}

variable "health_check_grace_period_seconds" {
  type        = number
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers"
  default     = 0
}

variable "runtime_platform" {
  type        = list(map(string))
  description = <<-EOT
    Zero or one runtime platform configurations that containers in your task may use.
    Map of strings with optional keys `operating_system_family` and `cpu_architecture`.
    See `runtime_platform` docs https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition#runtime_platform
    EOT
  default     = []
}

variable "efs_volumes" {
  type = list(object({
    host_path = string
    name      = string
    efs_volume_configuration = list(object({
      file_system_id          = string
      root_directory          = string
      transit_encryption      = string
      transit_encryption_port = string
      authorization_config = list(object({
        access_point_id = string
        iam             = string
      }))
    }))
  }))

  description = "Task EFS volume definitions as list of configuration objects. You cannot define both Docker volumes and EFS volumes on the same task definition."
  default     = []
}

variable "docker_volumes" {
  type = list(object({
    host_path = string
    name      = string
    docker_volume_configuration = list(object({
      autoprovision = bool
      driver        = string
      driver_opts   = map(string)
      labels        = map(string)
      scope         = string
    }))
  }))

  description = "Task docker volume definitions as list of configuration objects. You cannot define both Docker volumes and EFS volumes on the same task definition."
  default     = []
}

variable "proxy_configuration" {
  type = object({
    type           = string
    container_name = string
    properties     = map(string)
  })
  description = "The proxy configuration details for the App Mesh proxy. See `proxy_configuration` docs https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html#proxy-configuration-arguments"
  default     = null
}

variable "ignore_changes_task_definition" {
  type        = bool
  description = "Whether to ignore changes in container definition and task definition in the ECS service"
  default     = true
}

variable "ignore_changes_desired_count" {
  type        = bool
  description = "Whether to ignore changes for desired count in the ECS service"
  default     = false
}

variable "assign_public_ip" {
  type        = bool
  description = "Assign a public IP address to the ENI (Fargate launch type only). Valid values are `true` or `false`. Default `false`"
  default     = false
}

variable "propagate_tags" {
  type        = string
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION"
  default     = null
}

variable "enable_ecs_managed_tags" {
  type        = bool
  description = "Specifies whether to enable Amazon ECS managed tags for the tasks within the service"
  default     = false
}

variable "capacity_provider_strategies" {
  type        = list(any)
  description = "The capacity provider strategies to use for the service. See `capacity_provider_strategy` configuration block: https://www.terraform.io/docs/providers/aws/r/ecs_service.html#capacity_provider_strategy"
  default     = []
}

variable "service_registries" {
  type        = list(any)
  description = <<-EOT
    Zero or one service discovery registries for the service.
    The currently supported service registry is Amazon Route 53 Auto Naming Service - `aws_service_discovery_service`;
    see `service_registries` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1"
    Service registry is object with required key `registry_arn = string` and optional keys
      `port           = number`
      `container_name = string`
      `container_port = number`
    EOT

  default = []
}

variable "permissions_boundary" {
  type        = string
  description = "A permissions boundary ARN to apply to the 3 roles that are created."
  default     = ""
}

variable "use_old_arn" {
  type        = bool
  description = "A flag to enable/disable tagging the ecs resources that require the new arn format"
  default     = false
}

variable "wait_for_steady_state" {
  type        = bool
  description = "If true, it will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing"
  default     = false
}

variable "task_definition" {
  type        = string
  description = "Reuse an existing task definition family and revision for the ecs service instead of creating one"
  default     = null
}

variable "force_new_deployment" {
  type        = bool
  description = "Enable to force a new task deployment of the service."
  default     = false
}

variable "exec_enabled" {
  type        = bool
  description = "Specifies whether to enable Amazon ECS Exec for the tasks within the service"
  default     = false
}

variable "circuit_breaker_deployment_enabled" {
  type        = bool
  description = "If `true`, enable the deployment circuit breaker logic for the service"
  default     = false
}

variable "circuit_breaker_rollback_enabled" {
  type        = bool
  description = "If `true`, Amazon ECS will roll back the service if a service deployment fails"
  default     = false
}

variable "ephemeral_storage_size" {
  type        = number
  description = "The number of GBs to provision for ephemeral storage on Fargate tasks. Must be greater than or equal to 21 and less than or equal to 200"
  default     = 0

  validation {
    condition     = var.ephemeral_storage_size == 0 || (var.ephemeral_storage_size >= 21 && var.ephemeral_storage_size <= 200)
    error_message = "The ephemeral_storage_size value must be inclusively between 21 and 200."
  }
}

variable "role_tags_enabled" {
  type        = string
  description = "Enable/disable tags on ECS roles"
  default     = true
}

variable "logs_cloudwatch_retention" {
  description = "Number of days you want to retain log events in the log group."
  default     = 90
  type        = number
}

variable "logs_cloudwatch_group" {
  description = "CloudWatch log group to create and use. Default: /aws/ecs/{ecs_cluster_name}/logs/{name}/{environment}"
  default     = ""
  type        = string
}

variable "kms_key_id" {
  description = "KMS customer managed key (CMK) ARN for encrypting application logs."
  type        = string
  default     = null
}

variable "autoscaling_enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = false
}

variable "min_capacity" {
  type        = number
  description = "Minimum number of running instances of a Service"
  default     = 1
}

variable "max_capacity" {
  type        = number
  description = "Maximum number of running instances of a Service"
  default     = 2
}

variable "scale_up_adjustment" {
  type        = number
  description = "Scaling adjustment to make during scale up event"
  default     = 1
}

variable "scale_up_cooldown" {
  type        = number
  description = "Period (in seconds) to wait between scale up events"
  default     = 60
}

variable "scale_down_adjustment" {
  type        = number
  description = "Scaling adjustment to make during scale down event"
  default     = -1
}

variable "scale_down_cooldown" {
  type        = number
  description = "Period (in seconds) to wait between scale down events"
  default     = 300
}

variable "target_group" {
  type        = any
  description = "(Optional) Provides a Target Group resource for use with Load Balancer resources."
  default     = {}
}
