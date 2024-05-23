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

module "datasync_s3" {
  source           = "../../../../modules/migration/datasync/datasync-s3/"
  agent_arns       = var.agent_arns
  s3_bucket_arn    = var.s3_bucket_arn
  s3_config        = var.s3_config
  s3_storage_class = var.s3_storage_class
  subdirectory     = var.subdirectory
  tags             = var.tags

}