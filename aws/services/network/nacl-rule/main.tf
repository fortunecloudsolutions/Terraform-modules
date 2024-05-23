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
module "nacl_rule" {
  source        = "../../../modules/network/nacl-rule"
  nacl_id       = var.nacl_id
  protocol      = var.protocol
  rule_no       = var.rule_no
  egress_enable = var.egress_enable
  action        = var.action
  cidr          = var.cidr
  fport         = var.fport
  tport         = var.tport
}