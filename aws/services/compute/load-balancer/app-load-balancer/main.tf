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

module "alb" {
  source                       = "../../../../modules/load-balancer/app-load-balancer"
  alb_name                     = var.alb_name
  alb_internal                 = var.alb_internal
  security_group_ids           = var.security_group_ids
  idle_timeout                 = var.idle_timeout
  enable_alb_delete_via_awsapi = var.enable_alb_delete_via_awsapi
  ip_address_type              = var.ip_address_type
  tags                         = var.tags
  access_log_bucket_name       = var.access_log_bucket_name
  attach_alb_subnet_ids        = var.attach_alb_subnet_ids
  enable_access_logs           = var.enable_access_logs
  eip_alloc_ids                = var.eip_alloc_ids
  private_ip4_for_internal_alb = var.private_ip4_for_internal_alb
}