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


module "crawler" {
  source                 = "../../../../modules/analytics/glue/glue-crawler"
  database_name          = var.database_name
  name                   = var.name
  iam_role               = var.iam_role
  classifiers            = var.classifiers
  configuration          = var.configuration
  description            = var.description
  schedule               = var.schedule
  security_configuration = var.security_configuration
  table_prefix           = var.table_prefix
  tags                   = var.tags
  dynamodb_target        = var.dynamodb_target
  jdbc_target            = var.jdbc_target
  s3_target              = var.s3_target
  catalog_target         = var.catalog_target
  mongodb_target         = var.mongodb_target
  schema_change_policy   = var.schema_change_policy
  lineage_configuration  = var.lineage_configuration
  recrawl_policy         = var.recrawl_policy
}