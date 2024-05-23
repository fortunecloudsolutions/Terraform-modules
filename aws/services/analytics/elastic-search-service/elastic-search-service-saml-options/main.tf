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


module "saml_options" {
  source       = "../../../../modules/analytics/elastic-search-service/elastic-search-service-saml-options"
  domain_name  = var.domain_name
  saml_options = var.saml_options

}