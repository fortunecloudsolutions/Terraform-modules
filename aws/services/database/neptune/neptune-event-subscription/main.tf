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


module "event_subscription" {
  source           = "../../../../modules/database/neptune/neptune-event-subscription"
  name             = var.name
  name_prefix      = var.name_prefix
  sns_topic_arn    = var.sns_topic_arn
  enabled          = var.enabled
  source_type      = var.source_type
  source_ids       = var.source_ids
  event_categories = var.event_categories
  tags             = var.tags
  timeouts         = var.timeouts
}