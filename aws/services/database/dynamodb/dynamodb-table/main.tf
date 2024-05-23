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


module "table" {
  source                 = "../../../../modules/database/dynamodb/dynamodb-table"
  name                   = var.name
  billing_mode           = var.billing_mode
  read_capacity          = var.read_capacity
  write_capacity         = var.write_capacity
  hash_key               = var.hash_key
  range_key              = var.range_key
  stream_enabled         = var.stream_enabled
  stream_view_type       = var.stream_view_type
  tags                   = var.tags
  attribute              = var.attribute
  ttl                    = var.ttl
  local_secondary_index  = var.local_secondary_index
  global_secondary_index = var.global_secondary_index
  replica                = var.replica
  server_side_encryption = var.server_side_encryption
  point_in_time_recovery = var.point_in_time_recovery
  timeouts               = var.timeouts

}




