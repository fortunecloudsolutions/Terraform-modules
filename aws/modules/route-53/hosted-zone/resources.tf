locals {
  tag_pairs = var.tags
}


resource "aws_route53_zone" "hosted_zone" {
  name          = var.name
  comment       = var.comment
  force_destroy = var.force_destroy
  tags          = local.tag_pairs

  dynamic "vpc" {
    for_each = var.vpc != null ? var.vpc : []
    content {
      vpc_id     = lookup(vpc.value, "vpc_id", null)
      vpc_region = lookup(vpc.value, "vpc_region", null)
    }
  }

}