resource "aws_s3_bucket_analytics_configuration" "bucket_analytics_configuration" {
  bucket = var.bucket
  name   = var.name

  dynamic "filter" {
    for_each = var.filter != null ? [var.filter] : []
    content {

      prefix = lookup(filter.value, "prefix", null)
      tags   = lookup(filter.value, "tags", null)

    }
  }

  dynamic "storage_class_analysis" {
    for_each = var.storage_class_analysis != null ? var.storage_class_analysis : []
    content {
      dynamic "data_export" {
        for_each = lookup(storage_class_analysis.value, "data_export") != null ? [lookup(storage_class_analysis.value, "data_export")] : []
        content {
          output_schema_version = lookup(data_export.value, "output_schema_version", null)
          dynamic "destination" {
            for_each = lookup(data_export.value, "destination") != null ? [lookup(data_export.value, "destination")] : []
            content {
              dynamic "s3_bucket_destination" {
                for_each = lookup(destination.value, "s3_bucket_destination") != null ? [lookup(destination.value, "s3_bucket_destination")] : []
                content {
                  bucket_arn        = lookup(s3_bucket_destination.value, "bucket_arn", null)
                  bucket_account_id = lookup(s3_bucket_destination.value, "bucket_account_id", null)
                  format            = lookup(s3_bucket_destination.value, "format", null)
                  prefix            = lookup(s3_bucket_destination.value, "prefix", null)
                }
              }
            }
          }
        }
      }
    }
  }
}


   