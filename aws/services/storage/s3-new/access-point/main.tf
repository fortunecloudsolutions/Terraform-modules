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


module "s3_access_point" {
  source                            = "../../../../modules/volumes/s3-new/access-point"
  bucket                            = var.bucket
  name                              = var.name
  account_id                        = var.account_id
  policy                            = var.policy
  public_access_block_configuration = var.public_access_block_configuration
  vpc_configuration                 = var.vpc_configuration

}
