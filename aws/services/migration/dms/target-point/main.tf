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

module "target_endpoint" {
  source                      = "../../../../modules/migration/dms/endpoint/"
  certificate_arn             = var.certificate_arn
  database_name               = var.database_name
  elasticsearch_settings      = var.elasticsearch_settings
  endpoint_id                 = var.endpoint_id
  endpoint_type               = "target"
  engine_name                 = var.engine_name
  extra_connection_attributes = var.extra_connection_attributes
  kafka_settings              = var.kafka_settings
  kinesis_settings            = var.kinesis_settings
  kms_key_arn                 = var.kms_key_arn
  mongodb_settings            = var.mongodb_settings
  password                    = var.password
  port                        = var.port
  s3_settings                 = var.s3_settings
  server_name                 = var.server_name
  service_access_role         = var.service_access_role
  ssl_mode                    = var.ssl_mode
  tags                        = var.tags
  username                    = var.username
}