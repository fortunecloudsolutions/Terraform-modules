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


module "lambda_permission" {
  source              = "../../../../modules/compute/lambda/lambda-permission"
  statement_id        = var.statement_id
  action              = var.action
  function_name       = var.function_name
  principal           = var.principal
  source_arn          = var.source_arn
  qualifier           = var.qualifier
  event_source_token  = var.event_source_token
  source_account      = var.source_account
  statement_id_prefix = var.statement_id_prefix
}