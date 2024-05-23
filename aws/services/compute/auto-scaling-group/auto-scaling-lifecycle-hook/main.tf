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

module "asg_lifecyle_hook" {
  source                  = "../../../../modules/auto-scaling-group/auto-scaling-lifecycle-hook"
  name                    = var.name
  autoscaling_group_name  = var.autoscaling_group_name
  default_result          = var.default_result
  heartbeat_timeout       = var.heartbeat_timeout
  lifecycle_transition    = var.lifecycle_transition
  notification_metadata   = var.notification_metadata
  notification_target_arn = var.notification_target_arn
  role_arn                = var.role_arn
}