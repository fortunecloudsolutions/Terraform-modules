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
module "volume_attach" {
  source       = "../../../../modules/volumes/ebs/ebs-attach"
  volume_id    = var.volume_id
  device_name  = var.device_name
  instance_id  = var.instance_id
  force_detach = var.force_detach
  skip_destroy = var.skip_destroy
}