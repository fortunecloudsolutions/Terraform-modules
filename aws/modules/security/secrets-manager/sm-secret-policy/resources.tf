resource "aws_secretsmanager_secret_policy" "secret_policy" {
  secret_arn          = var.secret_arn
  policy              = var.policy
  block_public_policy = var.block_public_policy
}
