resource "aws_neptune_cluster_instance" "cluster_instance" {
  cluster_identifier           = var.cluster_identifier
  engine                       = var.engine
  instance_class               = var.instance_class
  apply_immediately            = var.apply_immediately
  auto_minor_version_upgrade   = var.auto_minor_version_upgrade
  availability_zone            = var.availability_zone
  engine_version               = var.engine_version
  identifier                   = var.identifier
  identifier_prefix            = var.identifier_prefix
  neptune_subnet_group_name    = var.neptune_subnet_group_name
  neptune_parameter_group_name = var.neptune_parameter_group_name
  port                         = var.port
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  promotion_tier               = var.promotion_tier
  publicly_accessible          = var.publicly_accessible
  tags                         = var.tags

  timeouts {
    create = lookup(var.timeouts, "create", "90m")
    update = lookup(var.timeouts, "update", "90m")
    delete = lookup(var.timeouts, "delete", "90m")
  }
  
}