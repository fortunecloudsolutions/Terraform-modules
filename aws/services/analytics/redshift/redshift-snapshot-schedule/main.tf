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


module "snapshot_schedule" {
  source            = "../../../../modules/analytics/redshift/redshift-snapshot-schedule"
  identifier        = var.identifier
  identifier_prefix = var.identifier_prefix
  description       = var.description
  force_destroy     = var.force_destroy
  definitions       = var.definitions
  tags              = var.tags
}