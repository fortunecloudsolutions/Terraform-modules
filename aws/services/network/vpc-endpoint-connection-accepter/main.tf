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


module "aws_vpc_endpoint_connection_accepter" {
  source       = "../../../modules/network/vpc-endpoint-connection-accepter"
 vpc_endpoint_service_id = var.vpc_endpoint_service_id
  vpc_endpoint_id         = var.vpc_endpoint_id

}