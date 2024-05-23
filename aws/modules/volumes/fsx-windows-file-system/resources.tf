
resource "aws_fsx_windows_file_system" "fsx_windows_file_system" {
  storage_capacity                  = var.storage_capacity
  subnet_ids                        = var.subnet_ids
  throughput_capacity               = var.throughput_capacity
  active_directory_id               = var.self_managed_active_directory == null ? var.active_directory_id : null
  automatic_backup_retention_days   = var.automatic_backup_retention_days
  copy_tags_to_backups              = var.copy_tags_to_backups
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  kms_key_id                        = var.kms_key_arn
  security_group_ids                = var.security_group_ids

  dynamic "self_managed_active_directory" {
    for_each = (var.self_managed_active_directory != null && var.active_directory_id == null ?
    [var.self_managed_active_directory] : [])
    content {
      dns_ips                                = lookup(self_managed_active_directory.value, "dns_ips")
      domain_name                            = lookup(self_managed_active_directory.value, "domain_name")
      password                               = lookup(self_managed_active_directory.value, "password")
      username                               = lookup(self_managed_active_directory.value, "username")
      file_system_administrators_group       = lookup(self_managed_active_directory.value, "file_system_administrators_group")
      organizational_unit_distinguished_name = lookup(self_managed_active_directory.value, "organizational_unit_distinguished_name")
    }
  }

  skip_final_backup             = var.skip_final_backup
  tags                          = var.tags
  weekly_maintenance_start_time = var.weekly_maintenance_start_time
  deployment_type               = var.deployment_type
  preferred_subnet_id           = var.preferred_subnet_id
  storage_type                  = var.storage_type

  timeouts {
    create = lookup(var.timeouts, "create", "60m")
    delete = lookup(var.timeouts, "delete", "60m")
  }
}
