resource "aws_glue_security_configuration" "security_configuration" {
  name = var.name

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration != null ? [var.encryption_configuration] : []
    content {
      dynamic "cloudwatch_encryption" {
        for_each = lookup(encryption_configuration.value, "cloudwatch_encryption") != null ? [lookup(encryption_configuration.value, "cloudwatch_encryption")] : []
        content {
          cloudwatch_encryption_mode = lookup(cloudwatch_encryption.value, "cloudwatch_encryption_mode", "DISABLED")
          kms_key_arn                = lookup(cloudwatch_encryption.value, "kms_key_arn", null)
        }
      }

      dynamic "job_bookmarks_encryption" {
        for_each = lookup(encryption_configuration.value, "job_bookmarks_encryption") != null ? [lookup(encryption_configuration.value, "job_bookmarks_encryption")] : []
        content {
          job_bookmarks_encryption_mode = lookup(job_bookmarks_encryption.value, "job_bookmarks_encryption_mode", "DISABLED")
          kms_key_arn                   = lookup(job_bookmarks_encryption.value, "kms_key_arn", null)
        }
      }

      dynamic "s3_encryption" {
        for_each = lookup(encryption_configuration.value, "s3_encryption") != null ? [lookup(encryption_configuration.value, "s3_encryption")] : []
        content {
          s3_encryption_mode = lookup(s3_encryption.value, "s3_encryption_mode", "DISABLED")
          kms_key_arn        = lookup(s3_encryption.value, "kms_key_arn", null)
        }
      }
    }
  }
}