resource "aws_s3_bucket_ownership_controls" "bucket_ownership_controls" {
  bucket = var.bucket
  
  dynamic "rule" {
    for_each = var.rule!= null ? var.rule : []
    content {
      object_ownership = lookup(rule.value, "object_ownership",null)
    }
  }

}
