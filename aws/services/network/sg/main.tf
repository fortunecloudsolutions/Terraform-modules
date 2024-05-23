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
module "sg" {
  source  = "../../../modules/network/sg"
  vpc_id  = var.vpc_id
  sg_name = var.sg_name
  sg_text = var.sg_text

  ingress1_desc            = var.ingress1_desc
  ingress1_fport           = var.ingress1_fport
  ingress1_tport           = var.ingress1_tport
  ingress1_protocol        = var.ingress1_protocol
  ingress1_cidr            = var.ingress1_cidr
  ingress1_ipv6_cidr       = var.ingress1_ipv6_cidr
  ingress1_prefix_ids      = var.ingress1_prefix_ids
  ingress1_security_groups = var.ingress1_security_groups
  egress1_desc             = var.egress1_desc
  egress1_fport            = var.egress1_fport
  egress1_tport            = var.egress1_tport
  egress1_protocol         = var.egress1_protocol
  egress1_cidr             = var.egress1_cidr
  egress1_ipv6_cidr        = var.egress1_ipv6_cidr
  egress1_prefix_ids       = var.egress1_prefix_ids
  egress1_security_groups  = var.egress1_security_groups


}
