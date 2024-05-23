resource "aws_datasync_task" "task" {
  destination_location_arn = var.destination_location_arn
  source_location_arn      = var.source_location_arn
  cloudwatch_log_group_arn = var.cloudwatch_log_group_arn
  dynamic "excludes" {
    for_each = var.excludes != null ? [var.excludes] : []
    content {
      filter_type = lookup(excludes.value, "filter_type")
      value       = lookup(excludes.value, "value")
    }
  }
  name = var.name
  dynamic "schedule" {
    for_each = var.schedule != null ? [var.schedule] : []
    content {
      schedule_expression = lookup(schedule.value, "schedule_expression")
    }
  }
  tags = var.tags
  dynamic "options" {
    for_each = (var.options != null ? [var.options] : [])
    content {
      atime                  = lookup(options.value, "atime")
      bytes_per_second       = lookup(options.value, "bytes_per_second")
      gid                    = lookup(options.value, "gid")
      log_level              = lookup(options.value, "log_level")
      mtime                  = lookup(options.value, "mtime")
      overwrite_mode         = lookup(options.value, "overwrite_mode")
      posix_permissions      = lookup(options.value, "posix_permissions")
      preserve_deleted_files = lookup(options.value, "preserve_deleted_files")
      preserve_devices       = lookup(options.value, "preserve_devices")
      task_queueing          = lookup(options.value, "task_queueing")
      transfer_mode          = lookup(options.value, "transfer_mode")
      uid                    = lookup(options.value, "uid")
      verify_mode            = lookup(options.value, "verify_mode")
    }
  }
}