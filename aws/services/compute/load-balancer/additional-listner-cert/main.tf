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

module "additional_ssl_certs" {
  source                = "../../../../modules/load-balancer/additional-listner-cert"
  number_of_certs_added = var.number_of_certs_added
  listener_arn          = var.listener_arn
  certificate_arn       = var.certificate_arn
}
  