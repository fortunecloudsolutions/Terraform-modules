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
module "nacl" {
  source           = "../../../modules/network/nacl"
  vpc_id           = var.vpc_id
  subnet_ids       = var.subnet_ids
  egress1_protocol = var.egress1_protocol
  egress1_rule_no  = var.egress1_rule_no
  egress1_action   = var.egress1_action
  egress1_cidr     = var.egress1_cidr
  egress1_fport    = var.egress1_fport
  egress1_tport    = var.egress1_tport

  ingress1_protocol = var.ingress1_protocol
  ingress1_rule_no  = var.ingress1_rule_no
  ingress1_action   = var.ingress1_action
  ingress1_cidr     = var.ingress1_cidr
  ingress1_fport    = var.ingress1_fport
  ingress1_tport    = var.ingress1_tport
  # ingress_enable = var.ingress_enable
  # egress_enable = var.egress_enable
  nacl_name = var.nacl_name
  tags      = var.tags
}
