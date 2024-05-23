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

module "health_check" {
  source                  = "../../../modules/route-53/health-check"
  reference_name          = var.reference_name
  endpoint                = var.endpoint
  type                    = var.type
  invert_healthcheck      = var.invert_healthcheck
  disabled                = var.disabled
  calculated_health_check = var.calculated_health_check
  cloudwatch              = var.cloudwatch
  tags                    = var.tags
}