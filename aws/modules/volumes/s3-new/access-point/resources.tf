resource "aws_s3_access_point" "s3_access_point" {
  bucket     = var.bucket
  name       = var.name
  account_id = var.account_id
  policy     = var.policy

  dynamic "public_access_block_configuration" {
    for_each = var.public_access_block_configuration != null ? [var.public_access_block_configuration] : []
    content {

      block_public_acls       = lookup(public_access_block_configuration.value, "block_public_acls", null)
      block_public_policy     = lookup(public_access_block_configuration.value, "block_public_policy", null)
      ignore_public_acls      = lookup(public_access_block_configuration.value, "ignore_public_acls", null)
      restrict_public_buckets = lookup(public_access_block_configuration.value, "restrict_public_buckets", null)

    }
  }

  dynamic "vpc_configuration" {
    for_each = var.vpc_configuration != null ? [var.vpc_configuration] : []
    content {

      vpc_id = lookup(vpc_configuration.value, "vpc_id")
    }
  }


}
