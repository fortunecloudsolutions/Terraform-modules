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

module "register_nlb" {
  source                              = "../../../../modules/load-balancer/target-group-nlb-attach"
  target_group_arn                    = var.target_group_arn
  instance_ip_ecscontainer_lambda_arn = var.instance_ip_ecscontainer_lambda_arn
  target_port                         = var.target_port
  target_type                         = var.target_type
  az_ip_address                       = var.az_ip_address
  number_of_targets                   = var.number_of_targets
}  