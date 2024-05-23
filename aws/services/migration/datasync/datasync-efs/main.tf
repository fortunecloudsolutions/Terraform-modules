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

module "datasync_efs" {
  source              = "../../../../modules/migration/datasync/datasync-efs/"
  ec2_config          = var.ec2_config
  efs_file_system_arn = var.efs_file_system_arn
  subdirectory        = var.subdirectory
  tags                = var.tags
}
  