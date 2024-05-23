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


module "trigger" {
  source        = "../../../../modules/analytics/glue/glue-trigger"
  name          = var.name
  type          = var.type
  description   = var.description
  enabled       = var.enabled
  schedule      = var.schedule
  tags          = var.tags
  workflow_name = var.workflow_name
  actions       = var.actions
  predicate     = var.predicate
  timeouts      = var.timeouts
}