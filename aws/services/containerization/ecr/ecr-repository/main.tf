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


module "ecr_repository" {
  source               = "../../../../modules/containers/ecr/ecr-repository"
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  tags                 = var.tags
  timeouts             = var.timeouts
}