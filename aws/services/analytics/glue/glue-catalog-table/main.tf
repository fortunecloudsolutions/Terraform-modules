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


module "catalog_table" {
  source             = "../../../../modules/analytics/glue/glue-catalog-table"
  name               = var.name
  database_name      = var.database_name
  catalog_id         = var.catalog_id
  description        = var.description
  table_type         = var.table_type
  owner              = var.owner
  parameters         = var.parameters
  retention          = var.retention
  view_expanded_text = var.view_expanded_text
  view_original_text = var.view_original_text
  partition_index    = var.partition_index
  partition_keys     = var.partition_keys
  storage_descriptor = var.storage_descriptor
  target_table       = var.target_table

}