provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.max_lease_seconds
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


module "aws_flow_log" {
  source          = "../../../modules/network/flow-log"
  iam_role_arn    = var.iam_role_arn
  log_destination = var.log_destination
  traffic_type    = var.traffic_type
  vpc_id          = var.vpc_id
}