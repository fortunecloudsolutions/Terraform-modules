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


module "cluster_endpoint" {
  source                      = "../../../../modules/database/neptune/neptune-cluster-endpoint"
  cluster_identifier          = var.cluster_identifier
  cluster_endpoint_identifier = var.cluster_endpoint_identifier
  endpoint_type               = var.endpoint_type
  excluded_members            = var.excluded_members
  static_members              = var.static_members
  tags                        = var.tags
}