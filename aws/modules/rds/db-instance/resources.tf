resource "aws_db_instance" "rds" {

  allocated_storage                     = var.allocated_storage
  allow_major_version_upgrade           = var.allow_major_version_upgrade
  apply_immediately                     = var.apply_immediately
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  availability_zone                     = var.availability_zone
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  ca_cert_identifier                    = var.ca_cert_identifier
  character_set_name                    = var.character_set_name
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  db_name                               = var.db_name
  db_subnet_group_name                  = var.db_subnet_group_name
  delete_automated_backups              = var.delete_automated_backups
  deletion_protection                   = var.deletion_protection
  domain                                = var.domain
  domain_iam_role_name                  = var.domain_iam_role_name
  enabled_cloudwatch_logs_exports       = var.enabled_cloudwatch_logs_exports
  engine                                = var.engine
  engine_version                        = var.engine_version
  final_snapshot_identifier             = var.final_snapshot_identifier
  iam_database_authentication_enabled   = var.iam_database_authentication_enabled
  identifier                            = var.identifier
  identifier_prefix                     = var.identifier_prefix
  instance_class                        = var.instance_class
  iops                                  = var.iops
  kms_key_id                            = var.kms_key_id
  license_model                         = var.license_model
  maintenance_window                    = var.maintenance_window
  max_allocated_storage                 = var.max_allocated_storage
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = var.monitoring_role_arn
  multi_az                              = var.multi_az
  # name                                  = var.name Deprecated
  nchar_character_set_name              = var.nchar_character_set_name
  network_type                          = var.network_type
  option_group_name                     = var.option_group_name
  parameter_group_name                  = var.parameter_group_name
  password                              = var.password
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period
  port                                  = var.port
  publicly_accessible                   = var.publicly_accessible
  replica_mode                          = var.replica_mode
  replicate_source_db                   = var.replicate_source_db
  # security_group_names                  = var.security_group_names Deprecated
  skip_final_snapshot                   = var.skip_final_snapshot
  snapshot_identifier                   = var.snapshot_identifier
  storage_encrypted                     = var.storage_encrypted
  storage_type                          = var.storage_type
  tags                                  = var.tags
  timezone                              = var.timezone
  username                              = var.username
  vpc_security_group_ids                = var.vpc_security_group_ids
  customer_owned_ip_enabled             = var.customer_owned_ip_enabled


  dynamic "restore_to_point_in_time" {
    for_each = var.restore_to_point_in_time != null ? [var.restore_to_point_in_time] : []

    content {
      restore_time                             = restore_to_point_in_time.value["restore_time"]
      source_db_instance_identifier            = restore_to_point_in_time.value["source_db_instance_identifier"]
      source_db_instance_automated_backups_arn = restore_to_point_in_time.value["source_db_instance_automated_backups_arn"]
      source_dbi_resource_id                   = restore_to_point_in_time.value["source_dbi_resource_id"]
      use_latest_restorable_time               = restore_to_point_in_time.value["use_latest_restorable_time"]
    }

  }

  dynamic "s3_import" {
    for_each = var.s3_import != null ? [var.s3_import] : []

    content {
      bucket_name           = s3_import.value["bucket_name"]
      bucket_prefix         = s3_import.value["bucket_prefix"]
      ingestion_role        = s3_import.value["ingestion_role"]
      source_engine         = s3_import.value["source_engine"]
      source_engine_version = s3_import.value["source_engine_version"]
    }

  }


  timeouts {
    create = lookup(var.timeouts, "create", "60m")
    update = lookup(var.timeouts, "update", "60m")
    delete = lookup(var.timeouts, "delete", "60m")
  }

}
