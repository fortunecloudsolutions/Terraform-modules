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

module "vault_aws_secret_backend" {
  source                = "../../../../modules/iam/adminvault/vault-aws-backend-path/"
  access_key            = var.access_key
  secret_key            = var.secret_key
  region                = var.region
  default_lease_seconds = var.default_lease_seconds
  max_lease_seconds     = var.max_lease_seconds
  path                  = var.path
}