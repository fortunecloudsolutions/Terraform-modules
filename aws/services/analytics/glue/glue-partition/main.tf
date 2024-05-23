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


module "partition" {
  source             = "../../../../modules/analytics/glue/glue-partition"
  database_name      = var.database_name
  partition_values   = var.partition_values
  catalog_id         = var.catalog_id
  parameters         = var.parameters
  storage_descriptor = var.storage_descriptor
  table_name         = var.table_name

}