resource "aws_datasync_location_efs" "efs" {

  dynamic "ec2_config" {
    for_each = var.ec2_config != null ? [var.ec2_config] : []
    content {
      security_group_arns = lookup(ec2_config.value, "security_group_arns", [])
      subnet_arn          = lookup(ec2_config.value, "subnet_arn")
    }
  }

  efs_file_system_arn = var.efs_file_system_arn
  subdirectory        = var.subdirectory
  tags                = var.tags

}