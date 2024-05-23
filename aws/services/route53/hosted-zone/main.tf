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

module "hosted_zone" {
  source        = "../../../modules/route-53/hosted-zone"
  name          = var.name
  comment       = var.comment
  force_destroy = var.force_destroy
  tags          = var.tags
  vpc           = var.vpc
}