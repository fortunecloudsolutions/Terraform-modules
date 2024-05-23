resource "aws_s3_bucket_metric" "bucket_metric" {
  bucket = var.bucket
  name   = var.name
  
  dynamic "filter" {
    for_each = var.filter != null ? [var.filter] : []
    content {

      prefix = lookup(filter.value, "prefix",null)
      tags   = lookup(filter.value, "tags",null)
    }
  }

}