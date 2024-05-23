resource "aws_dms_endpoint" "endpoint" {
  certificate_arn = var.certificate_arn
  database_name   = var.database_name

  dynamic "elasticsearch_settings" {
    for_each = var.elasticsearch_settings != null ? [var.elasticsearch_settings] : []
    content {
      endpoint_uri               = lookup(elasticsearch_settings.value, "endpoint_uri")
      error_retry_duration       = lookup(elasticsearch_settings.value, "error_retry_duration", 300)
      full_load_error_percentage = lookup(elasticsearch_settings.value, "full_load_error_percentage", 10)
      service_access_role_arn    = lookup(elasticsearch_settings.value, "service_access_role_arn")
    }
  }

  endpoint_id                 = var.endpoint_id
  endpoint_type               = var.endpoint_type
  engine_name                 = var.engine_name
  extra_connection_attributes = var.extra_connection_attributes

  dynamic "kafka_settings" {
    for_each = var.kafka_settings != null ? [var.kafka_settings] : []
    content {
      broker = lookup(kafka_settings.value, "broker", null)
      topic  = lookup(kafka_settings.value, "topic", "kafka-default-topic")
    }
  }

  dynamic "kinesis_settings" {
    for_each = var.kinesis_settings != null ? [var.kinesis_settings] : []
    content {
      message_format          = lookup(kinesis_settings.value, "message_format", "json")
      service_access_role_arn = lookup(kinesis_settings.value, "service_access_role_arn", null)
      stream_arn              = lookup(kinesis_settings.value, "stream_arn", null)
    }
  }

  kms_key_arn = var.kms_key_arn

  dynamic "mongodb_settings" {
    for_each = var.mongodb_settings != null ? [var.mongodb_settings] : []
    content {
      auth_mechanism      = lookup(mongodb_settings.value, "auth_mechanism", "default")
      auth_source         = lookup(mongodb_settings.value, "auth_source", "admin")
      auth_type           = lookup(mongodb_settings.value, "auth_type", "password")
      docs_to_investigate = lookup(mongodb_settings.value, "docs_to_investigate", 1000)
      extract_doc_id      = lookup(mongodb_settings.value, "extract_doc_id", "false")
      nesting_level       = lookup(mongodb_settings.value, "nesting_level", "none")
    }
  }

  password = var.password
  port     = var.port

  dynamic "s3_settings" {
    for_each = var.s3_settings != null ? [var.s3_settings] : []
    content {
      bucket_folder             = lookup(s3_settings.value, "bucket_folder", null)
      bucket_name               = lookup(s3_settings.value, "bucket_name", null)
      compression_type          = lookup(s3_settings.value, "compression_type", "NONE")
      csv_delimiter             = lookup(s3_settings.value, "csv_delimiter", ",")
      csv_row_delimiter         = lookup(s3_settings.value, "csv_row_delimiter", "\n")
      external_table_definition = lookup(s3_settings.value, "external_table_definition", null)
      service_access_role_arn   = lookup(s3_settings.value, "service_access_role_arn", null)
    }
  }

  server_name         = var.server_name
  service_access_role = var.service_access_role
  ssl_mode            = var.ssl_mode
  tags                = var.tags
  username            = var.username

}