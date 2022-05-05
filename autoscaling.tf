resource "aws_appautoscaling_target" "this" {
  count              = var.autoscaling_enabled ? 1 : 0
  service_namespace  = "ecs"
  resource_id        = "service/${var.ecs_cluster_name}/${local.full_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  min_capacity       = var.min_capacity
  max_capacity       = var.max_capacity
}

resource "aws_appautoscaling_policy" "up" {
  count              = var.autoscaling_enabled ? 1 : 0
  name               = "Scale-UP"
  service_namespace  = "ecs"
  resource_id        = "service/${var.ecs_cluster_name}/${local.full_name}"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = var.scale_up_cooldown
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = var.scale_up_adjustment
    }
  }
}

resource "aws_appautoscaling_policy" "down" {
  count              = var.autoscaling_enabled ? 1 : 0
  name               = "Scale-Down"
  service_namespace  = "ecs"
  resource_id        = "service/${var.ecs_cluster_name}/${local.full_name}"
  scalable_dimension = "ecs:service:DesiredCount"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = var.scale_down_cooldown
    metric_aggregation_type = "Average"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = var.scale_down_adjustment
    }
  }
}
