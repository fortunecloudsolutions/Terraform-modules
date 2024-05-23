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

data "template_file" "mount_data" {
  template = file("${path.module}/../templates/${var.mount_script}")

  vars = {
    device_name = var.device_name
    volume_name = var.volume_name
  }
}
module "remote_exec" {
  source           = "../../../modules/ec2/remote-exec"
  content          = data.template_file.mount_data.rendered
  host             = var.host
  user_name        = var.user_name
  private_key      = var.pem_key
  destination_file = var.destination_file
}