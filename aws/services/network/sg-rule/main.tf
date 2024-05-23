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
module "sg_rule" {
  source                = "../../../modules/network/sg-rule"
  num_of_rules          = var.num_of_rules
  desc                  = var.desc
  rule_type             = var.rule_type
  fport                 = var.fport
  tport                 = var.tport
  protocol              = var.protocol
  cidr                  = var.cidr
  ipv6_cidr             = var.ipv6_cidr
  prefix_ids            = var.prefix_ids
  security_group_id     = var.security_group_id
  src_security_group_id = var.source_security_group_id
}
