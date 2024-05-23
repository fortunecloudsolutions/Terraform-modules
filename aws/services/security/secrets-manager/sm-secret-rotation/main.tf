provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}

data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}
provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}
module "secret_rotation" {
  source              = "../../../../modules/security/secrets-manager/sm-secret-rotation"
  secret_id           = var.secret_id
  rotation_lambda_arn = var.rotation_lambda_arn
  rotation_rules      = var.rotation_rules
}
