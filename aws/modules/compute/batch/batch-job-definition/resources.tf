resource "aws_batch_job_definition" "job_definition" {
  name                  = var.name
  container_properties  = var.container_properties
  parameters            = var.parameters
  platform_capabilities = var.platform_capabilities
  propagate_tags        = var.propagate_tags
  tags                  = var.tags
  type                  = var.type
  dynamic "retry_strategy" {
    for_each = var.retry_strategy != null ? [var.retry_strategy] : []
    content {
      attempts = lookup(retry_strategy.value, "attempts", null)
      dynamic "evaluate_on_exit" {
        for_each = lookup(retry_strategy.value, "evaluate_on_exit") != null ? lookup(retry_strategy.value, "evaluate_on_exit") : []
        content {
          action           = lookup(evaluate_on_exit.value, "action")
          on_exit_code     = lookup(evaluate_on_exit.value, "on_exit_code", null)
          on_reason        = lookup(evaluate_on_exit.value, "on_reason", null)
          on_status_reason = lookup(evaluate_on_exit.value, "on_status_reason", null)

        }
      }

    }
  }

  dynamic "timeout" {
    for_each = var.timeout != null ? [var.timeout] : []
    content {
      attempt_duration_seconds = lookup(timeout.value, "attempt_duration_seconds", 60)
    }

  }

}