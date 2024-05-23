

resource "aws_db_instance" "rds" {

  identifier                  = var.identifier #var.identifier
  allow_major_version_upgrade = var.allow_major
  auto_minor_version_upgrade  = var.allow_minor
  engine                      = var.engine_name
  engine_version              = var.engine_version
  instance_class              = var.instance
  allocated_storage           = var.storage
  storage_encrypted           = var.storage_encrypted
  db_subnet_group_name        = var.db_subnet_group_name
  parameter_group_name        = var.parameter_group_name
  option_group_name           = var.option_group_name
  name                        = var.name
  username                    = var.username
  password                    = var.password
  port                        = var.port
  copy_tags_to_snapshot       = var.copy_tags_to_snapshot
  monitoring_interval         = var.monitoring_interval
  publicly_accessible         = var.publicly_accessible
  storage_type                = var.storage_type
  domain                      = var.domain
  domain_iam_role_name        = var.domain_iam_role_name
  multi_az                    = var.multi_az

  skip_final_snapshot    = var.skip_final_snapshot
  vpc_security_group_ids = var.vpc_security_group_ids
  depends_on             = [var.depends]


  # disable backups to create DB faster
  backup_retention_period = var.backup_retention_period

  license_model = var.license_model


  tags                                = var.tags
  apply_immediately                   = var.apply_immediately
  availability_zone                   = var.availability_zone
  backup_window                       = var.backup_window
  ca_cert_identifier                  = var.ca_cert_identifier
  delete_automated_backups            = var.delete_automated_backups
  deletion_protection                 = var.deletion_protection
  final_snapshot_identifier           = var.final_snapshot_identifier
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  iops                                = var.iops
  kms_key_id                          = var.kms_key_id
  maintenance_window                  = var.maintenance_window
  max_allocated_storage               = var.max_allocated_storage
  monitoring_role_arn                 = var.monitoring_role_arn
  replicate_source_db                 = var.replicate_source_db
  snapshot_identifier                 = var.snapshot_identifier
  timezone                            = var.timezone

  timeouts {
    create = lookup(var.timeouts, "create", "60m")
    update = lookup(var.timeouts, "update", "60m")
    delete = lookup(var.timeouts, "delete", "60m")
  }

}
