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


module "composite_alarm" {
  source                    = "../../../../modules/management-governance/cloud-watch/cloudwatch-composite-alarm"
  alarm_description         = var.alarm_description
  alarm_name                = var.alarm_name
  alarm_actions             = var.alarm_actions
  ok_actions                = var.ok_actions
  actions_enabled           = var.actions_enabled
  alarm_rule                = var.alarm_rule
  insufficient_data_actions = var.insufficient_data_actions
  tags                      = var.tags
}