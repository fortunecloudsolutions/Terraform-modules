resource "aws_redshift_cluster" "cluster" {
  cluster_identifier                  = var.cluster_identifier
  database_name                       = var.database_name
  master_username                     = var.master_username
  master_password                     = var.master_password
  node_type                           = var.node_type
  cluster_type                        = var.cluster_type
  cluster_security_groups             = var.cluster_security_groups
  vpc_security_group_ids              = var.vpc_security_group_ids
  cluster_subnet_group_name           = var.cluster_subnet_group_name
  availability_zone                   = var.availability_zone
  cluster_parameter_group_name        = var.cluster_parameter_group_name
  automated_snapshot_retention_period = var.automated_snapshot_retention_period
  port                                = var.port
  cluster_version                     = var.cluster_version
  allow_version_upgrade               = var.allow_version_upgrade
  number_of_nodes                     = var.number_of_nodes
  publicly_accessible                 = var.publicly_accessible
  encrypted                           = var.encrypted
  enhanced_vpc_routing                = var.enhanced_vpc_routing
  kms_key_id                          = var.kms_key_id
  elastic_ip                          = var.elastic_ip
  skip_final_snapshot                 = var.skip_final_snapshot
  final_snapshot_identifier           = var.final_snapshot_identifier
  snapshot_identifier                 = var.snapshot_identifier
  snapshot_cluster_identifier         = var.snapshot_cluster_identifier
  owner_account                       = var.owner_account
  iam_roles                           = var.iam_roles
  tags                                = var.tags

  dynamic "logging" {
    for_each = var.logging != null ? [var.logging] : []
    content {
      enable        = lookup(logging.value, "enable")
      bucket_name   = lookup(logging.value, "bucket_name", null)
      s3_key_prefix = lookup(logging.value, "s3_key_prefix", null)
    }
  }

  dynamic "snapshot_copy" {
    for_each = var.snapshot_copy != null ? [var.snapshot_copy] : []
    content {
      destination_region = lookup(snapshot_copy.value, "destination_region")
      retention_period   = lookup(snapshot_copy.value, "retention_period", 7)
      grant_name         = lookup(snapshot_copy.value, "grant_name", null)
    }
  }

  timeouts {
    create = lookup(var.timeouts, "create", "75m")
    update = lookup(var.timeouts, "update", "75m")
    delete = lookup(var.timeouts, "delete", "40m")
  }

}