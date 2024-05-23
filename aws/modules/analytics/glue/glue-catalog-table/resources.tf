resource "aws_glue_catalog_table" "catalog_table" {
  name               = var.name
  database_name      = var.database_name
  catalog_id         = var.catalog_id
  description        = var.description
  table_type         = var.table_type
  owner              = var.owner
  parameters         = var.parameters
  retention          = var.retention
  view_expanded_text = var.view_expanded_text
  view_original_text = var.view_original_text

  dynamic "partition_index" {
    for_each = var.partition_index != null ? var.partition_index : []
    content {
      index_name = lookup(partition_index.value, "index_name")
      keys       = lookup(partition_index.value, "keys")

    }
  }

  dynamic "partition_keys" {
    for_each = var.partition_keys != null ? var.partition_keys : []
    content {
      comment = lookup(partition_keys.value, "comment", null)
      name    = lookup(partition_keys.value, "name")
      type    = lookup(partition_keys.value, "type", null)

    }
  }

  dynamic "storage_descriptor" {
    for_each = var.storage_descriptor != null ? [var.storage_descriptor] : []
    content {
      bucket_columns = lookup(storage_descriptor.value, "bucket_columns", null)
      dynamic "columns" {
        for_each = lookup(storage_descriptor.value, "columns") != null ? lookup(storage_descriptor.value, "columns") : []
        content {
          comment    = lookup(columns.value, "comment", null)
          name       = lookup(columns.value, "name")
          parameters = lookup(columns.value, "parameters", null)
          type       = lookup(columns.value, "type", null)
        }
      }
      compressed        = lookup(storage_descriptor.value, "compressed", null)
      input_format      = lookup(storage_descriptor.value, "input_format", null)
      location          = lookup(storage_descriptor.value, "location", null)
      number_of_buckets = lookup(storage_descriptor.value, "number_of_buckets", null)
      output_format     = lookup(storage_descriptor.value, "output_format", null)
      parameters        = lookup(storage_descriptor.value, "parameters", null)
      dynamic "schema_reference" {
        for_each = lookup(storage_descriptor.value, "schema_reference") != null ? [lookup(storage_descriptor.value, "schema_reference")] : []
        content {
          dynamic "schema_id" {
            for_each = lookup(schema_reference.value, "schema_id") != null ? [lookup(schema_reference.value, "schema_id")] : []
            content {
              registry_name = lookup(schema_id.value, "registry_name", null)
              schema_arn    = lookup(schema_id.value, "schema_arn", null)
              schema_name   = lookup(schema_id.value, "schema_name", null)

            }
          }
          schema_version_id     = lookup(schema_reference.value, "schema_version_id", null)
          schema_version_number = lookup(schema_reference.value, "schema_version_number")

        }
      }
      dynamic "ser_de_info" {
        for_each = lookup(storage_descriptor.value, "ser_de_info") != null ? [lookup(storage_descriptor.value, "ser_de_info")] : []
        content {
          name                  = lookup(ser_de_info.value, "name", null)
          parameters            = lookup(ser_de_info.value, "parameters", null)
          serialization_library = lookup(ser_de_info.value, "serialization_library", null)

        }
      }

      dynamic "sort_columns" {
        for_each = lookup(storage_descriptor.value, "sort_columns") != null ? lookup(storage_descriptor.value, "sort_columns") : []
        content {
          column     = lookup(sort_columns.value, "column")
          sort_order = lookup(sort_columns.value, "sort_order")

        }
      }

      dynamic "skewed_info" {
        for_each = lookup(storage_descriptor.value, "skewed_info") != null ? [lookup(storage_descriptor.value, "skewed_info")] : []
        content {
          skewed_column_names               = lookup(skewed_info.value, "skewed_column_names", null)
          skewed_column_value_location_maps = lookup(skewed_info.value, "skewed_column_value_location_maps", null)
          skewed_column_values              = lookup(skewed_info.value, "skewed_column_values", null)

        }
      }
      stored_as_sub_directories = lookup(storage_descriptor.value, "stored_as_sub_directories", null)

    }
  }
  dynamic "target_table" {
    for_each = var.target_table != null ? [var.target_table] : []
    content {
      catalog_id    = lookup(target_table.value, "catalog_id")
      database_name = lookup(target_table.value, "database_name")
      name          = lookup(target_table.value, "name")

    }
  }


}
