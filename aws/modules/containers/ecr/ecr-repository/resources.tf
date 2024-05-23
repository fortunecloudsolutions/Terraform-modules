resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.name
  image_tag_mutability = var.image_tag_mutability
  tags                 = var.tags

  dynamic "image_scanning_configuration" {
    for_each = var.image_scanning_configuration != null ? [var.image_scanning_configuration] : []
    content {
      scan_on_push = lookup(image_scanning_configuration.value, "scan_on_push")
    }
  }

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration != null ? [var.encryption_configuration] : []
    content {
      encryption_type = lookup(encryption_configuration.value, "encryption_type", null)
      kms_key         = lookup(encryption_configuration.value, "kms_key", null)
    }
  }

  timeouts {
    delete = lookup(var.timeouts, "delete", "20m")
  }


}
 