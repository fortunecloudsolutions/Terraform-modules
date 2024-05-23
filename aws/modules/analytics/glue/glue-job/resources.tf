resource "aws_glue_job" "job" {
  name                      = var.name
  role_arn                  = var.role_arn
  connections               = var.connections
  default_arguments         = var.default_arguments
  non_overridable_arguments = var.non_overridable_arguments
  description               = var.description
  glue_version              = var.glue_version
  max_capacity              = var.max_capacity
  max_retries               = var.max_retries
  tags                      = var.tags
  timeout                   = var.timeout
  security_configuration    = var.security_configuration
  worker_type               = var.worker_type
  number_of_workers         = var.number_of_workers

  dynamic "command" {
    for_each = var.command != null ? [var.command] : []
    content {
      name            = lookup(command.value, "name", "glueetl")
      script_location = lookup(command.value, "script_location")
      python_version  = lookup(command.value, "python_version", null)


    }
  }

  dynamic "execution_property" {
    for_each = var.execution_property != null ? [var.execution_property] : []
    content {
      max_concurrent_runs = lookup(execution_property.value, "max_concurrent_runs", 1)
    }
  }

  dynamic "notification_property" {
    for_each = var.notification_property != null ? [var.notification_property] : []
    content {
      notify_delay_after = lookup(notification_property.value, "notify_delay_after", null)
    }
  }

}
