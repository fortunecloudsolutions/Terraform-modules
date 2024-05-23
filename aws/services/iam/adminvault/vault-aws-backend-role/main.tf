provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "iam_policy" {
  source     = "../../../../modules/iam/iam-policy"
  path       = "/"
  iam_policy = var.iam_policy
}

module "vault_aws_secret_backend_role" {
  source          = "../../../../modules/iam/adminvault/vault-aws-backend-role"
  path            = var.path
  name            = var.name
  credential_type = var.credential_type
  role_arns       = var.role_arns
  policy_arns     = module.iam_policy.policy_arn
  iam_groups      = var.iam_groups
  default_sts_ttl = var.default_sts_ttl
  max_sts_ttl     = var.max_sts_ttl
  depends_on      = [module.iam_policy.policy_arn]
}

