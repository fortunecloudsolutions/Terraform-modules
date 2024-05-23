resource "aws_ecrpublic_repository" "public_repository" {

  repository_name = var.repository_name
  dynamic "catalog_data" {
    for_each = var.catalog_data != null ? [var.catalog_data] : []
    content {
      about_text        = lookup(catalog_data.value, "about_text")
      architectures     = lookup(catalog_data.value, "architectures")
      description       = lookup(catalog_data.value, "description")
      logo_image_blob   = lookup(catalog_data.value, "logo_image_blob")
      operating_systems = lookup(catalog_data.value, "operating_systems")
      usage_text        = lookup(catalog_data.value, "usage_text")

    }
  }

  timeouts {
    delete = lookup(var.timeouts, "delete", "20m")
  }
}