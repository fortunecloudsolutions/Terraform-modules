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


module "bucket_analytics_configuration" {
  source                 = "../../../../modules/volumes/s3-new/bucket-analytics-configuration"
  bucket                 = var.bucket
  name                   = var.name
  filter                 = var.filter
  storage_class_analysis = var.storage_class_analysis
}
