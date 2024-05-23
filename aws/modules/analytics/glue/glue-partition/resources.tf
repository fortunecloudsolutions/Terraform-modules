resource "aws_glue_partition" "partition" {
  database_name    = var.database_name
  partition_values = var.partition_values
  catalog_id       = var.catalog_id
  parameters       = var.parameters
  table_name       = var.table_name


  dynamic "storage_descriptor" {
    for_each = var.storage_descriptor != null ? [var.storage_descriptor] : []
    content {
      dynamic "columns" {
        for_each = lookup(storage_descriptor.value, "columns") != null ? lookup(storage_descriptor.value, "columns") : []
        content {
          comment = lookup(columns.value, "comment", null)
          name    = lookup(columns.value, "name")
          type    = lookup(columns.value, "type", null)
        }
      }
      bucket_columns    = lookup(storage_descriptor.value, "bucket_columns", null)
      compressed        = lookup(storage_descriptor.value, "compressed", null)
      input_format      = lookup(storage_descriptor.value, "input_format", null)
      location          = lookup(storage_descriptor.value, "location", null)
      number_of_buckets = lookup(storage_descriptor.value, "number_of_buckets", null)
      output_format     = lookup(storage_descriptor.value, "output_format", null)
      parameters        = lookup(storage_descriptor.value, "parameters", null)

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


}
