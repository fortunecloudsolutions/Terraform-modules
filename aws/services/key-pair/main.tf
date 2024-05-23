
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

module "tls_private_key" {
  source    = "../../modules/ec2/tls-private-key"
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits

}

module "key_pair" {
  source     = "../../modules/ec2/key-pair"
  key_name   = var.key_name
  public_key = module.tls_private_key.public_key_openssh
  depends_on = [module.tls_private_key]
}

module "key_content_file" {
  source          = "../../modules/ec2/key-content-file"
  private_key_pem = module.tls_private_key.private_key_pem
  file_permission = var.file_permission
  filepath        = var.filepath
  key_name        = var.key_name
  depends_on      = [module.tls_private_key]
}

