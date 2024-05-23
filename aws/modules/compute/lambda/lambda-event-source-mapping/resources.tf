resource "aws_lambda_event_source_mapping" "lambda_event_source_mapping" {
  event_source_arn                   = var.event_source_arn
  function_name                      = var.function_name
  starting_position                  = var.starting_position
  batch_size                         = var.batch_size
  bisect_batch_on_function_error     = var.bisect_batch_on_function_error
  enabled                            = var.enabled
  function_response_types            = var.function_response_types
  maximum_batching_window_in_seconds = var.maximum_batching_window_in_seconds
  maximum_record_age_in_seconds      = var.maximum_record_age_in_seconds
  maximum_retry_attempts             = var.maximum_retry_attempts
  parallelization_factor             = var.parallelization_factor
  queues                             = var.queues
  starting_position_timestamp        = var.starting_position_timestamp
  topics                             = var.topics
  tumbling_window_in_seconds         = var.tumbling_window_in_seconds

  dynamic "destination_config" {
    for_each = var.destination_config != null ? [var.destination_config] : []
    content {

      dynamic "on_failure" {
        for_each = lookup(destination_config.value, "on_failure") != null ? [lookup(destination_config.value, "on_failure")] : []
        content {
          destination_arn = lookup(on_failure.value, "destination_arn")

        }
      }
    }
  }


  dynamic "self_managed_event_source" {
    for_each = var.self_managed_event_source != null ? [var.self_managed_event_source] : []
    content {
      endpoints = lookup(self_managed_event_source.value, "endpoints")

    }
  }

  dynamic "source_access_configuration" {
    for_each = var.source_access_configuration != null ? var.source_access_configuration : []
    content {
      type = lookup(source_access_configuration.value, "type")
      uri  = lookup(source_access_configuration.value, "uri")

    }
  }

}
