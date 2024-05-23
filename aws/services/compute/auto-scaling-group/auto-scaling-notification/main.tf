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

module "asg_notification" {
  source             = "../../../../modules/auto-scaling-group/auto-scaling-notification"
  asg_group_names    = var.asg_group_names
  notification_types = var.notification_types
  topic_arn          = var.topic_arn
}