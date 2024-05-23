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
module "cluster" {
  source       = "../../../../modules/ecs/ecs-cluster"
  capacity_providers                  = var.capacity_providers
  configuration                       = var.configuration
  default_capacity_provider_strategy  = var.default_capacity_provider_strategy
  name                                = var.name
  setting                             = var.setting
  tags                                = var.tags
}

