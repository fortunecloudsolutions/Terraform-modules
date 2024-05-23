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


module "snapshot_copy_grant" {
  source                   = "../../../../modules/analytics/redshift/redshift-snapshot-copy-grant"
  snapshot_copy_grant_name = var.snapshot_copy_grant_name
  kms_key_id               = var.kms_key_id
  tags                     = var.tags

}