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


module "event_archive" {
  source                           = "../../../../modules/management-governance/event-bridge/cloudwatch-event-archive"
  name             = var.name
  description      = var.description
  event_source_arn = var.event_source_arn
  retention_days   = var.retention_days
  event_pattern    = var.event_pattern

}