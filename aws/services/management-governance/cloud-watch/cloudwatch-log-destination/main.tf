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


module "cloudwatch_log_destination" {
  source     = "../../../../modules/management-governance/cloud-watch/cloudwatch-log-destination"
  name       = var.name
  role_arn   = var.role_arn
  target_arn = var.target_arn
}