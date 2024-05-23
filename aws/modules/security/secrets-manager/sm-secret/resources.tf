resource "aws_secretsmanager_secret" "secret_manager" {
  name                    = var.name
  kms_key_id              = var.kms_key_id
  name_prefix             = var.name_prefix
  description             = var.description
  policy                  = var.policy
  recovery_window_in_days = var.recovery_window_in_days
  rotation_lambda_arn     = var.rotation_lambda_arn
  tags                    = var.tags

  dynamic "rotation_rules" {
    for_each = var.rotation_rules != null ? [var.rotation_rules] : []
    content {
      automatically_after_days = lookup(rotation_rules.value, "automatically_after_days")
    }
  }
}
