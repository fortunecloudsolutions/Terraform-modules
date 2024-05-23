provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.max_lease_seconds
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


module "aws_ami" {
  source              = "../../../modules/ami/ami"
  name                = var.name
  virtualization_type = var.virtualization_type
  root_device_name    = var.root_device_name
  imds_support        = var.imds_support
  ebs_block_device    = var.ebs_block_device

}