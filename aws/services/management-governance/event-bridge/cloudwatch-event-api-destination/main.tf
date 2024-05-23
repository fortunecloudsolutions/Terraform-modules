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


module "event_api_destination" {
  source                           = "../../../../modules/management-governance/event-bridge/cloudwatch-event-api-destination"
  name                             = var.name
  description                      = var.description
  invocation_endpoint              = var.invocation_endpoint
  http_method                      = var.http_method
  invocation_rate_limit_per_second = var.invocation_rate_limit_per_second
  connection_arn                   = var.connection_arn

}