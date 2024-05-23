resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = var.name
  name_prefix       = var.name_prefix
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id
  tags              = var.tags
}