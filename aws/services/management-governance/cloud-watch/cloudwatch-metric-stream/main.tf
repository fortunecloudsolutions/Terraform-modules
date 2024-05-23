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


module "cloudwatch_metric_stream" {
  source                    = "../../../../modules/management-governance/cloud-watch/cloudwatch-metric-stream"
  name          = var.name
  role_arn      = var.role_arn
  firehose_arn  = var.firehose_arn
  output_format = var.output_format
  name_prefix=var.name_prefix
  tags=var.tags
  exclude_filter=var.exclude_filter
  include_filter=var.include_filter
}
