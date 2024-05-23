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


module "aws_network_interface_attachment" {
  source               = "../../../modules/network/network-interface-attachment"
  instance_id          = var.instance_id
  network_interface_id = var.network_interface_id
  device_index         = var.device_index
}