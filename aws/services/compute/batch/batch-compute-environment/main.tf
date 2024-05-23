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


module "compute_environment" {
  source                          = "../../../../modules/compute/batch/batch-compute-environment"
  compute_environment_name        = var.compute_environment_name
  compute_environment_name_prefix = var.compute_environment_name_prefix
  service_role                    = var.service_role
  state                           = var.state
  tags                            = var.tags
  type                            = var.type
  compute_resources               = var.compute_resources
}