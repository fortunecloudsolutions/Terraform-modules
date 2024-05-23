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
  source = "../../../modules/rds/dbparameter-group"
  family = var.family

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
  subnet_ids = var.subnet_id

  tags = var.tags
}
#*******************************************************#
#      Create Option group
#********************************************************
module "option_group" {
  source     = "../../../modules/rds/option-group"
  identifier = var.identifier
  #name                     = var.option_name
  #desc                     = var.option_desc
  engine_name          = var.engine_name
  major_engine_version = var.major_engine_version
  options              = var.options
  tags                 = var.tags

}
#*******************************************************#
#      Create Active Directory
#********************************************************
module "active_directory" {
  source   = "../../../modules/rds/active-directory"
  name     = var.domain_name
  password = var.actdir_password
  #enable_sso = var.enable_sso
  #edition = var.edition
  short_name = var.netbiosname
  vpc_id     = var.vpc_id
  subnet_ids = [var.subnet_id[0], var.subnet_id[1]]
  dir_type   = var.dir_type

} #*******************************************************#
#      Create iam Roles
#********************************************************
module "iam_role" {
  source = "../../../modules/iam/iam-role"
  #name = var.role_name

  role_policy = file("${path.module}/policies/role-policy-rds.json")
  tags        = var.tags
}
#*******************************************************#
#      Associate role to policy
#********************************************************
module "rolepolicy" {
  source     = "../../../modules/iam/role-policy-attach"
  role       = module.iam_role.role_name
  policy_arn = var.policy_arn
}
#*******************************************************#
#      Create RDS
#********************************************************
module "rds" {

  source                  = "../../../modules/rds/rds"
  identifier              = var.identifier
  allow_major             = var.allow_major
  allow_minor             = var.allow_minor
  engine_name             = var.engine_name
  engine_version          = var.major_engine_version
  instance                = var.instance
  storage                 = var.storage
  storage_encrypted       = var.storage_encrypted
  db_subnet_group_name    = module.subnet_group.subnet_group_id
  parameter_group_name    = module.db_parameter.dbparam_id
  option_group_name       = module.option_group.option_group_id
  name                    = null #var.identifier
  username                = var.username
  password                = var.password
  port                    = var.port
  copy_tags_to_snapshot   = var.copy_tags_to_snapshot #= true
  monitoring_interval     = var.monitoring_interval   #= 0
  publicly_accessible     = var.publicly_accessible   #= true
  storage_type            = var.storage_type          #= "gp2"
  domain                  = module.active_directory.activedir_id
  domain_iam_role_name    = module.iam_role.role_name #"demo-rds-ad-auth"
  multi_az                = var.multi_az
  skip_final_snapshot     = var.skip_final_snapshot #= true
  vpc_security_group_ids  = var.security_group
  depends                 = []
  backup_retention_period = var.backup_retention_period # = 1


  license_model = var.license_model #= "license-included"


  tags = var.tags

  timeouts = var.timeouts
}