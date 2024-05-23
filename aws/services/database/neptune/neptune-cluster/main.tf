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


module "cluster" {
  source                               = "../../../../modules/database/neptune/neptune-cluster"
  cluster_identifier                   = var.cluster_identifier
  engine                               = var.engine
  backup_retention_period              = var.backup_retention_period
  preferred_backup_window              = var.preferred_backup_window
  skip_final_snapshot                  = var.skip_final_snapshot
  iam_database_authentication_enabled  = var.iam_database_authentication_enabled
  apply_immediately                    = var.apply_immediately
  availability_zones                   = var.availability_zones
  cluster_identifier_prefix            = var.cluster_identifier_prefix
  enable_cloudwatch_logs_exports       = var.enable_cloudwatch_logs_exports
  engine_version                       = var.engine_version
  final_snapshot_identifier            = var.final_snapshot_identifier
  iam_roles                            = var.iam_roles
  kms_key_arn                          = var.kms_key_arn
  neptune_subnet_group_name            = var.neptune_subnet_group_name
  neptune_cluster_parameter_group_name = var.neptune_cluster_parameter_group_name
  preferred_maintenance_window         = var.preferred_maintenance_window
  port                                 = var.port
  replication_source_identifier        = var.replication_source_identifier
  snapshot_identifier                  = var.snapshot_identifier
  storage_encrypted                    = var.storage_encrypted
  tags                                 = var.tags
  vpc_security_group_ids               = var.vpc_security_group_ids
  deletion_protection                  = var.deletion_protection
  timeouts                             = var.timeouts
}