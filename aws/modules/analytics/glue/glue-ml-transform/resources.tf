resource "aws_glue_ml_transform" "ml_transform" {
  name     = var.name
  role_arn = var.role_arn

  dynamic "input_record_tables" {
    for_each = var.input_record_tables != null ? var.input_record_tables : []
    content {
      database_name   = lookup(input_record_tables.value, "database_name")
      table_name      = lookup(input_record_tables.value, "table_name")
      catalog_id      = lookup(input_record_tables.value, "catalog_id", null)
      connection_name = lookup(input_record_tables.value, "connection_name", null)

    }
  }

  dynamic "parameters" {
    for_each = var.parameters != null ? [var.parameters] : []
    content {
      transform_type = lookup(parameters.value, "transform_type")
      dynamic "find_matches_parameters" {
        for_each = lookup(parameters.value, "find_matches_parameters") != null ? [lookup(parameters.value, "find_matches_parameters")] : []
        content {
          accuracy_cost_trade_off    = lookup(find_matches_parameters.value, "accuracy_cost_trade_off", null)
          enforce_provided_labels    = lookup(find_matches_parameters.value, "enforce_provided_labels", null)
          precision_recall_trade_off = lookup(find_matches_parameters.value, "precision_recall_trade_off", null)
          primary_key_column_name    = lookup(find_matches_parameters.value, "primary_key_column_name", null)

        }
      }
    }
  }

  description       = var.description
  glue_version      = var.glue_version
  max_capacity      = var.max_capacity
  max_retries       = var.max_retries
  tags              = var.tags
  timeout           = var.timeout
  worker_type       = var.worker_type
  number_of_workers = var.number_of_workers
}