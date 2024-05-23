provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_ttl_seconds
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


module "efs" {
  source          = "../../../../modules/volumes/efs/efs-mount-target"
  file_system_id  = var.file_system_id
  subnet_id       = var.subnet_id
  ip_address      = var.ip_address
  security_groups = var.security_groups
}