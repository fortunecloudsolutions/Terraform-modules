resource "aws_glue_crawler" "crawler" {
  database_name          = var.database_name
  name                   = var.name
  role                   = var.iam_role
  classifiers            = var.classifiers
  configuration          = var.configuration
  description            = var.description
  schedule               = var.schedule
  security_configuration = var.security_configuration
  table_prefix           = var.table_prefix
  tags                   = var.tags

  dynamic "dynamodb_target" {
    for_each = var.dynamodb_target != null ? var.dynamodb_target : []
    content {
      path      = lookup(dynamodb_target.value, "path")
      scan_all  = lookup(dynamodb_target.value, "scan_all", null)
      scan_rate = lookup(dynamodb_target.value, "scan_rate", null)

    }
  }

  dynamic "jdbc_target" {
    for_each = var.jdbc_target != null ? var.jdbc_target : []
    content {
      connection_name = lookup(jdbc_target.value, "connection_name")
      path            = lookup(jdbc_target.value, "path")
      exclusions      = lookup(jdbc_target.value, "exclusions", null)

    }
  }

  dynamic "s3_target" {
    for_each = var.s3_target != null ? var.s3_target : []
    content {
      path            = lookup(s3_target.value, "path")
      connection_name = lookup(s3_target.value, "connection_name", null)
      exclusions      = lookup(s3_target.value, "exclusions", null)
    }
  }

  dynamic "catalog_target" {
    for_each = var.catalog_target != null ? var.catalog_target : []
    content {
      database_name = lookup(catalog_target.value, "database_name")
      tables        = lookup(catalog_target.value, "tables")
    }
  }

  dynamic "mongodb_target" {
    for_each = var.mongodb_target != null ? var.mongodb_target : []
    content {
      connection_name = lookup(mongodb_target.value, "connection_name")
      path            = lookup(mongodb_target.value, "path")
      scan_all        = lookup(mongodb_target.value, "scan_all", true)

    }
  }

  dynamic "schema_change_policy" {
    for_each = var.schema_change_policy != null ? [var.schema_change_policy] : []
    content {
      delete_behavior = lookup(schema_change_policy.value, "delete_behavior", null)
      update_behavior = lookup(schema_change_policy.value, "update_behavior", null)

    }
  }


  dynamic "lineage_configuration" {
    for_each = var.lineage_configuration != null ? [var.lineage_configuration] : []
    content {
      crawler_lineage_settings = lookup(lineage_configuration.value, "crawler_lineage_settings", "Disable")

    }
  }

  dynamic "recrawl_policy" {
    for_each = var.recrawl_policy != null ? [var.recrawl_policy] : []
    content {
      recrawl_behavior = lookup(recrawl_policy.value, "recrawl_behavior", "CRAWL_EVERYTHING")

    }
  }

}
