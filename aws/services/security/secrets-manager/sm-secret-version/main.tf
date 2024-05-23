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
module "secret_version" {
  source         = "../../../../modules/security/secrets-manager/sm-secret-version"
  secret_id      = var.secret_id
  secret_string  = var.secret_string
  secret_binary  = var.secret_binary
  version_stages = var.version_stages
}
