resource "aws_alb_target_group" "this" {
  count                = length(keys(var.target_group)) > 0 ? 1 : 0
  name_prefix          = format("%.6s", local.full_name)
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = "ip"
  tags                 = var.tags
  deregistration_delay = lookup(var.target_group, "deregistration_delay", "300")

  dynamic "health_check" {
    for_each = length(keys(lookup(var.target_group, "health_check"))) > 0 ? [lookup(var.target_group, "health_check")] : []
    content {
      enabled             = true
      interval            = lookup(health_check.value, "interval", null)
      path                = lookup(health_check.value, "path", null)
      timeout             = lookup(health_check.value, "timeout", null)
      matcher             = lookup(health_check.value, "matcher", null)
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", null)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}
