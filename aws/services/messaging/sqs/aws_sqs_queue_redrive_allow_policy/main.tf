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

module "sqs_queue_redrive_allow_policy" {
  source                = "../../../../modules/messaging/sqs/aws_sqs_queue_redrive_allow_policy/"
  queue_url = var.queue_url
  redrive_allow_policy = var.redrive_allow_policy
}