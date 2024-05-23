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



module "users" {
  source            = "../../../modules/iam/add-users"
  username          = var.username
  path              = var.path
  password_length   = var.password_length
  password_required = var.password_required
  pgp_key           = var.pgp_key
}