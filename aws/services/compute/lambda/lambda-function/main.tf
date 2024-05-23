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


module "lambda_function" {
  source                         = "../../../../modules/compute/lambda/lambda-function"
  filename                       = var.filename
  function_name                  = var.function_name
  lambda_role                    = var.lambda_role
  handler                        = var.handler
  code_signing_config_arn        = var.code_signing_config_arn
  description                    = var.description
  image_uri                      = var.image_uri
  kms_key_arn                    = var.kms_key_arn
  layers                         = var.layers
  memory_size                    = var.memory_size
  package_type                   = var.package_type
  publish                        = var.publish
  reserved_concurrent_executions = var.reserved_concurrent_executions
  runtime                        = var.runtime
  s3_bucket                      = var.s3_bucket
  s3_key                         = var.s3_key
  s3_object_version              = var.s3_object_version
  source_code_hash               = var.source_code_hash
  tags                           = var.tags
  timeout                        = var.timeout
  dead_letter_config             = var.dead_letter_config
  environment                    = var.environment
  file_system_config             = var.file_system_config
  image_config                   = var.image_config
  tracing_config                 = var.tracing_config
  vpc_config                     = var.vpc_config
  timeouts                       = var.timeouts
}