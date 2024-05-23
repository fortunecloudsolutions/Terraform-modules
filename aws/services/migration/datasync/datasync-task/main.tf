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

module "datasync_task" {
  source                   = "../../../../modules/migration/datasync/datasync-task/"
  destination_location_arn = var.destination_location_arn
  source_location_arn      = var.source_location_arn
  cloudwatch_log_group_arn = var.cloudwatch_log_group_arn
  excludes                 = var.excludes
  name                     = var.name
  schedule                 = var.schedule
  tags                     = var.tags
  options                  = var.options
}