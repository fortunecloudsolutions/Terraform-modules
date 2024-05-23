resource "aws_glue_data_catalog_encryption_settings" "encryption_settings" {

  dynamic "data_catalog_encryption_settings" {
    for_each = var.data_catalog_encryption_settings != null ? [var.data_catalog_encryption_settings] : []
    content {
      dynamic "connection_password_encryption" {
        for_each = lookup(data_catalog_encryption_settings.value, "connection_password_encryption") != null ? [lookup(data_catalog_encryption_settings.value, "connection_password_encryption")] : []
        content {
          return_connection_password_encrypted = lookup(connection_password_encryption.value, "return_connection_password_encrypted")
          aws_kms_key_id                       = lookup(connection_password_encryption.value, "aws_kms_key_id", null)
        }
      }

      dynamic "encryption_at_rest" {
        for_each = lookup(data_catalog_encryption_settings.value, "encryption_at_rest") != null ? [lookup(data_catalog_encryption_settings.value, "encryption_at_rest")] : []
        content {
          catalog_encryption_mode = lookup(encryption_at_rest.value, "catalog_encryption_mode")
          sse_aws_kms_key_id      = lookup(encryption_at_rest.value, "sse_aws_kms_key_id", null)

        }
      }
    }
  }

  catalog_id = var.catalog_id
}