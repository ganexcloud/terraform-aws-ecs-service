output "ecs_exec_role_policy_id" {
  description = "The ECS service role policy ID, in the form of `role_name:role_policy_name`"
  value       = aws_iam_role_policy.ecs_exec[0].id
}

output "ecs_exec_role_policy_name" {
  description = "ECS service role name"
  value       = aws_iam_role_policy.ecs_exec[0].name
}

output "service_name" {
  description = "ECS Service name"
  value       = try(aws_ecs_service.default[0].name, aws_ecs_service.ignore_changes_task_definition[0].name, aws_ecs_service.ignore_changes_desired_count[0].name, aws_ecs_service.ignore_changes_task_definition_and_desired_count[0].name, "")
}

output "service_arn" {
  description = "ECS Service ARN"
  value       = try(aws_ecs_service.default[0].id, aws_ecs_service.ignore_changes_task_definition[0].id, aws_ecs_service.ignore_changes_desired_count[0].id, aws_ecs_service.ignore_changes_task_definition_and_desired_count[0].id, "")
}

output "service_role_arn" {
  description = "ECS Service role ARN"
  value       = aws_iam_role.ecs_service[0].arn
}

output "task_exec_role_name" {
  description = "ECS Task role name"
  value       = aws_iam_role.ecs_exec[0].name
}

output "task_exec_role_arn" {
  description = "ECS Task exec role ARN"
  value       = length(local.task_exec_role_arn) > 0 ? local.task_exec_role_arn : aws_iam_role.ecs_exec[0].arn
}

output "task_exec_role_id" {
  description = "ECS Task exec role id"
  value       = aws_iam_role.ecs_exec[0].unique_id
}

output "task_role_name" {
  description = "ECS Task role name"
  value       = aws_iam_role.ecs_task[0].name
}

output "task_role_arn" {
  description = "ECS Task role ARN"
  value       = length(local.task_role_arn) > 0 ? local.task_role_arn : aws_iam_role.ecs_task[0].arn
}

output "task_role_id" {
  description = "ECS Task role id"
  value       = aws_iam_role.ecs_task[0].unique_id
}

output "service_security_group_id" {
  description = "Security Group ID of the ECS task"
  value       = aws_security_group.ecs_service[0].id
}

output "task_definition_family" {
  description = "ECS task definition family"
  value       = aws_ecs_task_definition.this[0].family
}

output "task_definition_revision" {
  description = "ECS task definition revision"
  value       = aws_ecs_task_definition.this[0].revision
}

output "task_definition_arn" {
  description = "ECS task definition ARN"
  value       = aws_ecs_task_definition.this[0].arn
}

output "alb_target_group_arn" {
  description = "ECS task definition family"
  value       = aws_alb_target_group.this[0].arn
}

output "scale_up_policy_arn" {
  description = "ARN of the scale up policy"
  value       = aws_appautoscaling_policy.up[0].arn
}

output "scale_down_policy_arn" {
  description = "ARN of the scale down policy"
  value       = aws_appautoscaling_policy.down[0].arn
}
