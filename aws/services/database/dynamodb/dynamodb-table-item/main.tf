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


module "table_item" {
  source     = "../../../../modules/database/dynamodb/dynamodb-table-item"
  table_name = var.table_name
  hash_key   = var.hash_key
  range_key  = var.range_key
  item       = var.item
}


