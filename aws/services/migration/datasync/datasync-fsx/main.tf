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

module "datasync_fsx" {
  source              = "../../../../modules/migration/datasync/datasync-fsx/"
  fsx_filesystem_arn  = var.fsx_filesystem_arn
  password            = var.password
  user                = var.user
  domain              = var.domain
  security_group_arns = var.security_group_arns
  subdirectory        = var.subdirectory
  tags                = var.tags
}
  