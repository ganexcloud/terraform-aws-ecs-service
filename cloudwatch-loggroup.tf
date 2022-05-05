resource "aws_cloudwatch_log_group" "this" {
  name              = local.awslogs_group
  retention_in_days = var.logs_cloudwatch_retention
  kms_key_id        = var.kms_key_id
  tags              = var.tags
}
