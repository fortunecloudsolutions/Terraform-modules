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

module "ms_active_directory" {
  source     = "../../modules/rds/active-directory/"
  name       = var.name
  password   = var.password
  enable_sso = var.enable_sso
  edition    = var.edition
  short_name = var.short_name
  vpc_id     = var.vpc_id
  subnet_ids = [var.subnet_ids[0], var.subnet_ids[1]]
  dir_type   = var.dir_type
  size       = var.size
}