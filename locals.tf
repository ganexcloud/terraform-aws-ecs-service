locals {
  full_name               = "${var.name}-${var.environment}"
  task_role_arn           = try(var.task_role_arn[0], tostring(var.task_role_arn), "")
  create_task_role        = var.enabled && length(var.task_role_arn) == 0
  task_exec_role_arn      = try(var.task_exec_role_arn[0], tostring(var.task_exec_role_arn), "")
  create_exec_role        = var.enabled && length(var.task_exec_role_arn) == 0
  enable_ecs_service_role = var.enabled && var.network_mode != "awsvpc" && length(var.load_balancers) >= 1
  create_security_group   = var.enabled && var.network_mode == "awsvpc" && var.security_group_enabled
  volumes                 = concat(var.docker_volumes, var.efs_volumes)
  awslogs_group           = var.logs_cloudwatch_group == "" ? "/aws/ecs/${var.ecs_cluster_name}/logs/${var.name}/${var.environment}" : var.logs_cloudwatch_group
}
