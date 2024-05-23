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


module "event_bus" {
  source                           = "../../../../modules/management-governance/event-bridge/cloudwatch-event-bus"
 name              = var.name
  event_source_name = var.event_source_name
  tags=var.tags

}