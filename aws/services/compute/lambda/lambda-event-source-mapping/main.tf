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


module "lambda_event_source_mapping" {
  source                             = "../../../../modules/compute/lambda/lambda-event-source-mapping"
  event_source_arn                   = var.event_source_arn
  function_name                      = var.function_name
  starting_position                  = var.starting_position
  batch_size                         = var.batch_size
  bisect_batch_on_function_error     = var.bisect_batch_on_function_error
  enabled                            = var.enabled
  function_response_types            = var.function_response_types
  maximum_batching_window_in_seconds = var.maximum_batching_window_in_seconds
  maximum_record_age_in_seconds      = var.maximum_record_age_in_seconds
  maximum_retry_attempts             = var.maximum_retry_attempts
  parallelization_factor             = var.parallelization_factor
  queues                             = var.queues
  starting_position_timestamp        = var.starting_position_timestamp
  topics                             = var.topics
  tumbling_window_in_seconds         = var.tumbling_window_in_seconds
  destination_config                 = var.destination_config
  self_managed_event_source          = var.self_managed_event_source
  source_access_configuration        = var.source_access_configuration
}