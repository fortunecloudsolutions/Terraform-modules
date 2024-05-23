resource "aws_datasync_location_s3" "s3" {
  agent_arns    = var.agent_arns
  s3_bucket_arn = var.s3_bucket_arn
  dynamic "s3_config" {
    for_each = [var.s3_config]
    content {
      bucket_access_role_arn = lookup(s3_config.value, "bucket_access_role_arn")
    }
  }
  s3_storage_class = var.s3_storage_class
  subdirectory     = var.subdirectory
  tags             = var.tags
}