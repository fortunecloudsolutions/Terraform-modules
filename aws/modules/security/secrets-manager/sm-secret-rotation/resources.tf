resource "aws_secretsmanager_secret_rotation" "secret_rotation" {
  secret_id           = var.secret_id
  rotation_lambda_arn = var.rotation_lambda_arn
  dynamic "rotation_rules" {
    for_each = var.rotation_rules != null ? [var.rotation_rules] : []
    content {
      automatically_after_days = lookup(rotation_rules.value, "automatically_after_days")
    }
  }
}
