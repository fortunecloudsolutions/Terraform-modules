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

module "nlb" {
  source                       = "../../../../modules/load-balancer/net-load-balancer"
  nlb_name                     = var.nlb_name
  nlb_internal                 = var.nlb_internal
  enable_nlb_delete_via_awsapi = var.enable_nlb_delete_via_awsapi
  ip_address_type              = var.ip_address_type
  tags                         = var.tags
  access_log_bucket_name       = var.access_log_bucket_name
  enable_access_logs           = var.enable_access_logs
  attach_nlb_subnet_ids        = var.attach_nlb_subnet_ids
  eip_alloc_ids                = var.eip_alloc_ids
  private_ip4_for_internal_nlb = var.private_ip4_for_internal_nlb

}