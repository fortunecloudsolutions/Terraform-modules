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

module "ami" {
  source                  = "../../../modules/ec2/ami-from-instance"
  name                    = var.name
  source_instance_id      = var.source_instance_id
  snapshot_without_reboot = var.snapshot_without_reboot
  tags                    = var.tags
  timeouts                = var.timeouts
}
