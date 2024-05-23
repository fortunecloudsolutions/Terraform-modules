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


module "domain" {
  source                    = "../../../../modules/analytics/elastic-search-service/elastic-search-service-domain"
  domain_name               = var.domain_name
  access_policies           = var.access_policies
  advanced_options          = var.advanced_options
  elasticsearch_version     = var.elasticsearch_version
  tags                      = var.tags
  advanced_security_options = var.advanced_security_options
  cluster_config            = var.cluster_config
  cognito_options           = var.cognito_options
  domain_endpoint_options   = var.domain_endpoint_options
  ebs_options               = var.ebs_options
  encrypt_at_rest           = var.encrypt_at_rest
  log_publishing_options    = var.log_publishing_options
  node_to_node_encryption   = var.node_to_node_encryption
  snapshot_options          = var.snapshot_options
  vpc_options               = var.vpc_options
  timeouts                  = var.timeouts

}