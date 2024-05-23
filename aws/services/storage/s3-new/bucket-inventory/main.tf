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


module "bucket_inventory" {
  source                   = "../../../../modules/volumes/s3-new/bucket-inventory"
  bucket                   = var.bucket
  name                     = var.name
  included_object_versions = var.included_object_versions
  enabled                  = var.enabled
  optional_fields          = var.optional_fields
  schedule                 = var.schedule
  filter                   = var.filter
  destination              = var.destination
}
