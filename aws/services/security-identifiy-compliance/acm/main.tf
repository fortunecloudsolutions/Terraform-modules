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

module "cert" {
  source                    = "../../../modules/security-identifiy-compliance/acm"
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = var.validation_method
  options                   = var.options
  private_key               = var.private_key
  certificate_body          = var.certificate_body
  certificate_chain         = var.certificate_chain
  certificate_authority_arn = var.certificate_authority_arn
  tags                      = var.tags
}
