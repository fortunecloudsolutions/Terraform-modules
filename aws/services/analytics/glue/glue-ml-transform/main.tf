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


module "ml_transform" {
  source              = "../../../../modules/analytics/glue/glue-ml-transform"
  name                = var.name
  role_arn            = var.role_arn
  description         = var.description
  glue_version        = var.glue_version
  max_capacity        = var.max_capacity
  max_retries         = var.max_retries
  tags                = var.tags
  timeout             = var.timeout
  worker_type         = var.worker_type
  number_of_workers   = var.number_of_workers
  input_record_tables = var.input_record_tables
  parameters          = var.parameters


}