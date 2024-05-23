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


module "event_target" {
  source              = "../../../../modules/management-governance/event-bridge/cloudwatch-event-target"
  target_id           = var.target_id
  rule                = var.rule
  arn                 = var.arn
  event_bus_name      = var.event_bus_name
  input               = var.input
  input_path          = var.input_path
  role_arn            = var.role_arn
  run_command_targets = var.run_command_targets
  ecs_target          = var.ecs_target
  batch_target        = var.batch_target
  kinesis_target      = var.kinesis_target
  redshift_target     = var.redshift_target
  sqs_target          = var.sqs_target
  http_target         = var.http_target
  input_transformer   = var.input_transformer
  retry_policy        = var.retry_policy
  dead_letter_config  = var.dead_letter_config
}