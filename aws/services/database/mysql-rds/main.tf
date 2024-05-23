provider "vault" {
  address               = var.vault_addr
  token                 = var.vault_token
  max_lease_ttl_seconds = var.lease_seconds
}
data "vault_aws_access_credentials" "creds" {
  backend = var.backend
  role    = var.role
}
/*data "vault_generic_secret" "s3" {
  path = "aws/creds/s3"
}*/
provider "aws" {
  region     = var.region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
}

#*******************************************************#
#      Create dbparameter group
#********************************************************
module "db_parameter" {
  source     = "../../../modules/rds/dbparameter-group"
  family     = var.family
  tags       = var.tags
  parameters = var.parameters

}
#*******************************************************#
#      Create subnet group
#********************************************************
module "subnet_group" {
  source = "../../../modules/rds/subnet-group"
  #name       = var.subnetgrp_name
  #subnet_desc = var.subnet_desc
  subnet_ids = var.subnet_id #[module.subnet1.subnet_id,module.subnet2.subnet_id,module.subnet3.subnet_id]

  tags = var.tags
}
#*******************************************************#
#      Create Option group
#********************************************************
module "option_group" {
  source = "../../../modules/rds/option-group"
  #name                     = var.option_name
  #desc                     = var.option_desc
  engine_name          = var.engine_name
  major_engine_version = var.major_engine_version
  identifier           = var.identifier
  options              = var.options

}
#*******************************************************#
#      Create RDS
#********************************************************
module "rds" {

  source            = "../../../modules/rds/rds"
  identifier        = var.identifier
  allow_major       = var.allow_major
  allow_minor       = var.allow_minor
  engine_name       = var.engine_name
  engine_version    = var.engine_version
  instance          = var.instance
  storage           = var.storage
  storage_encrypted = var.storage_encrypted
  license_model     = var.license_model


  name     = null
  username = var.username
  password = var.password
  port     = var.port
  #iam_database_authentication_enabled = false
  db_subnet_group_name   = module.subnet_group.subnet_group_id
  parameter_group_name   = module.db_parameter.dbparam_id
  option_group_name      = module.option_group.option_group_id
  vpc_security_group_ids = var.security_group
  copy_tags_to_snapshot  = var.copy_tags_to_snapshot
  monitoring_interval    = var.monitoring_interval
  publicly_accessible    = var.publicly_accessible
  storage_type           = var.storage_type
  multi_az               = var.multi_az
  skip_final_snapshot    = var.skip_final_snapshot


  #depends = module.vpc.gateway_id
  depends = []


  backup_retention_period = var.backup_retention_period


  tags     = var.tags
  timeouts = var.timeouts
}