resource "aws_datasync_location_smb" "smb" {
  agent_arns = var.agent_arns
  domain     = var.domain
  dynamic "mount_options" {
    for_each = (var.mount_options != null ? [var.mount_options] : [])
    content {
      version = lookup(mount_options.value, "version")
    }
  }
  password        = var.password
  server_hostname = var.server_hostname
  subdirectory    = var.subdirectory
  tags            = var.tags
  user            = var.user

}