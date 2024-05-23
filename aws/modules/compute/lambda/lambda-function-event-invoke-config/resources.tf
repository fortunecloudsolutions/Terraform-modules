resource "aws_lambda_function_event_invoke_config" "lambda_event_invoke_config" {

  function_name                = var.function_name
  maximum_event_age_in_seconds = var.maximum_event_age_in_seconds
  maximum_retry_attempts       = var.maximum_retry_attempts
  qualifier                    = var.qualifier

  dynamic "destination_config" {
    for_each = var.destination_config != null ? [var.destination_config] : []
    content {

      dynamic "on_failure" {
        for_each = lookup(destination_config.value, "on_failure") != null ? [lookup(destination_config.value, "on_failure")] : []
        content {
          destination = lookup(on_failure.value, "destination")

        }
      }
      dynamic "on_success" {
        for_each = lookup(destination_config.value, "on_success") != null ? [lookup(destination_config.value, "on_success")] : []
        content {
          destination = lookup(on_success.value, "destination")

        }
      }
    }
  }
}