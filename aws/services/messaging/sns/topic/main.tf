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

module "topic" {
  source                = "../../../../modules/messaging/sns/topic/"
  name                  = var.name
  display_name          = var.display_name
  policy                = var.policy
  delivery_policy_https = var.delivery_policy_https
  kms_master_key_id     = var.kms_master_key_id
  app_status_logging    = var.app_status_logging
  http_status_logging   = var.http_status_logging
  lambda_status_logging = var.lambda_status_logging
  sqs_status_logging    = var.sqs_status_logging
  tags                  = var.tags
}