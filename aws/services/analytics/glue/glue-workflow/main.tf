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


module "workflow" {
  source                 = "../../../../modules/analytics/glue/glue-workflow"
  name                   = var.name
  default_run_properties = var.default_run_properties
  description            = var.description
  max_concurrent_runs    = var.max_concurrent_runs
  tags                   = var.tags
}