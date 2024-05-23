provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.max_lease_seconds
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

module "standaloneeip" {
  source = "../../../modules/network/eip/eip-standalone"
}

module "eip_assoc" {
  source            = "../../../modules/network/eip/eip-associate"
  instance_id       = var.instance_id
  eip_allocation_id = module.standaloneeip.eip_id
  depends_on        = [module.standaloneeip]
}