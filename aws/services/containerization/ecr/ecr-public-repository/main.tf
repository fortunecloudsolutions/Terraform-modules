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


module "public_repository" {
  source          = "../../../../modules/containers/ecr/ecr-public-repository"
  repository_name = var.repository_name
  catalog_data    = var.catalog_data
  timeouts        = var.timeouts

}