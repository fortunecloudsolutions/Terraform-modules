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


module "job_definition" {
  source                = "../../../../modules/compute/batch/batch-job-definition"
  name                  = var.name
  container_properties  = var.container_properties
  parameters            = var.parameters
  platform_capabilities = var.platform_capabilities
  propagate_tags        = var.propagate_tags
  tags                  = var.tags
  type                  = var.type
  retry_strategy        = var.retry_strategy
  timeout               = var.timeout
}