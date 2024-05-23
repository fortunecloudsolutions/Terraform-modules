resource "vault_aws_secret_backend_role" "resource" {
  backend         = var.path
  name            = var.name
  credential_type = var.credential_type
  role_arns       = var.role_arns
  policy_arns     = [var.policy_arns]
  iam_groups      = var.iam_groups
  default_sts_ttl = var.default_sts_ttl
  max_sts_ttl     = var.max_sts_ttl
}
