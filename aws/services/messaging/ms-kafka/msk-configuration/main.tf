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
module "msk_config" {
  source            = "../../../../modules/messaging/ms-kafka/msk-configuration"
  kafka_versions    = var.kafka_versions
  name              = var.name
  server_properties = var.server_properties
  description       = var.description
}