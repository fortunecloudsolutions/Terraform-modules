
resource "aws_s3_bucket_public_access_block" "this" {

  // Chain resources (s3_bucket -> s3_bucket_policy -> s3_bucket_public_access_block)
  // to prevent "A conflicting conditional operation is currently in progress against this resource."
  bucket                  = var.bucket_name
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
