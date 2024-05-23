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
module "volume" {
  source = "../../../../modules/volumes/ebs/ebs-create-attach"

  availability_zone    = var.availability_zone
  ebs_size             = var.ebs_size
  encrypted            = var.encrypted
  iops                 = var.iops
  multi_attach_enabled = var.multi_attach_enabled
  snapshot_id          = var.snapshot_id
  type                 = var.type
  kms_key_id           = var.kms_key_id
  tags                 = var.tags
  device_name          = var.device_name
  instance_id          = var.instance_id
  force_detach         = var.force_detach
  skip_destroy         = var.skip_destroy
}

