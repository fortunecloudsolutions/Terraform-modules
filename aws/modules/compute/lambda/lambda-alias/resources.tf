resource "aws_lambda_alias" "lambda_alias" {
  name             = var.name
  description      = var.description
  function_name    = var.function_name
  function_version = var.function_version


  dynamic "routing_config" {
    for_each = var.routing_config != null ? [var.routing_config] : []
    content {

      additional_version_weights = lookup(routing_config.value, "additional_version_weights", null)
    }
  }
}