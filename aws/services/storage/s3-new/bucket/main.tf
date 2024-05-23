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


module "bucket" {
  source                               = "../../../../modules/volumes/s3-new/bucket"
  bucket                               = var.bucket
  bucket_prefix                        = var.bucket_prefix
  acl                                  = var.acl
  policy                               = var.policy
  tags                                 = var.tags
  force_destroy                        = var.force_destroy
  acceleration_status                  = var.acceleration_status
  request_payer                        = var.request_payer
  website                              = var.website
  cors_rule                            = var.cors_rule
  versioning                           = var.versioning
  logging                              = var.logging
  lifecycle_rule                       = var.lifecycle_rule
  replication_configuration            = var.replication_configuration
  server_side_encryption_configuration = var.server_side_encryption_configuration
  object_lock_configuration            = var.object_lock_configuration
  grant                                = var.grant


}