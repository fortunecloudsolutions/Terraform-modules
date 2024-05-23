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
module "msk" {
  source                 = "../../../../modules/messaging/ms-kafka/msk-cluster"
  cluster_name           = var.cluster_name
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  enhanced_monitoring    = var.enhanced_monitoring
  tags                   = var.tags
  broker_node_group_info = var.broker_node_group_info
  configuration_info     = var.configuration_info
  encryption_info        = var.encryption_info
  client_authentication  = var.client_authentication
  open_monitoring        = var.open_monitoring
  logging_info           = var.logging_info
}