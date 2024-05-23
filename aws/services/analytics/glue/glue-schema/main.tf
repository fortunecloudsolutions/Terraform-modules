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


module "schema" {
  source            = "../../../../modules/analytics/glue/glue-schema"
  schema_name       = var.schema_name
  registry_arn      = var.registry_arn
  data_format       = var.data_format
  compatibility     = var.compatibility
  schema_definition = var.schema_definition
  description       = var.description
  tags              = var.tags
}