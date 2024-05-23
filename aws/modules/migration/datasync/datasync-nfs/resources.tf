resource "aws_datasync_location_nfs" "nfs" {
  dynamic "mount_options" {
    for_each = var.mount_options != null ? [var.mount_options] : []
    content {
      version = lookup(mount_options.value, "mount_options_version")
    }
  }
  dynamic "on_prem_config" {
    for_each = [var.on_prem_config]
    content {
      agent_arns = lookup(on_prem_config.value, "agent_arns")
    }
  }
  server_hostname = var.server_hostname
  subdirectory    = var.subdirectory
  tags            = var.tags
}