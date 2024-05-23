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


module "lambda_provisioned_concurrency_config" {
  source                            = "../../../../modules/compute/lambda/lambda-provisioned-concurrency-config"
  function_name                     = var.function_name
  provisioned_concurrent_executions = var.provisioned_concurrent_executions
  qualifier                         = var.qualifier
  timeouts                          = var.timeouts
}