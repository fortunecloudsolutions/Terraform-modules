resource "aws_s3_bucket_inventory" "bucket_inventory" {
  bucket                   = var.bucket
  name                     = var.name
  included_object_versions = var.included_object_versions
  enabled                  = var.enabled
  optional_fields          = var.optional_fields

  dynamic "schedule" {
    for_each = var.schedule != null ? [var.schedule] : []
    content {

      frequency = lookup(schedule.value, "frequency")
    }
  }

  dynamic "filter" {
    for_each = var.filter != null ? [var.filter] : []
    content {

      prefix = lookup(filter.value, "prefix")
    }
  }

  dynamic "destination" {
    for_each = var.destination != null ? [var.destination] : []
    content {
      dynamic "bucket" {
        for_each = lookup(destination.value, "bucket") != null ? [lookup(destination.value, "bucket")] : []
        content {
          format     = lookup(bucket.value, "format")
          bucket_arn = lookup(bucket.value, "bucket_arn")
          account_id = lookup(bucket.value, "account_id", null)
          prefix     = lookup(bucket.value, "prefix", null)
          dynamic "encryption" {
            for_each = lookup(bucket.value, "encryption") != null ? [lookup(bucket.value, "encryption")] : []
            content {

              dynamic "sse_kms" {
                for_each = lookup(encryption.value, "sse_kms") != null ? [lookup(encryption.value, "sse_kms")] : []
                content {
                  key_id = lookup(sse_kms.value, "key_id")
                }

              }
              dynamic "sse_s3" {
                for_each = lookup(encryption.value, "sse_s3") != null ? [lookup(encryption.value, "sse_s3")] : []
                content {
                }

              }
            }
          }
        }
      }
    }
  }
}
