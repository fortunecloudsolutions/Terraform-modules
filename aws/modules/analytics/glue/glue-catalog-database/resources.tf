resource "aws_glue_catalog_database" "catalog_database" {
  name         = var.name
  description  = var.description
  location_uri = var.location_uri
  parameters   = var.parameters

  dynamic "target_database" {
    for_each = var.target_database != null ? [var.target_database] : []
    content {
      catalog_id    = lookup(target_database.value, "catalog_id")
      database_name = lookup(target_database.value, "database_name")
    }
  }

}