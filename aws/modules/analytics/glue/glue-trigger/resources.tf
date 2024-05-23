resource "aws_glue_trigger" "trigger" {
  name          = var.name
  type          = var.type
  description   = var.description
  enabled       = var.enabled
  schedule      = var.schedule
  tags          = var.tags
  workflow_name = var.workflow_name

  dynamic "actions" {
    for_each = var.actions != null ? var.actions : []
    content {
      arguments              = lookup(actions.value, "arguments", null)
      crawler_name           = lookup(actions.value, "crawler_name", null)
      job_name               = lookup(actions.value, "job_name", null)
      timeout                = lookup(actions.value, "timeout", null)
      security_configuration = lookup(actions.value, "security_configuration", null)

      dynamic "notification_property" {
        for_each = lookup(actions.value, "notification_property") != null ? [lookup(actions.value, "notification_property")] : []
        content {
          notify_delay_after = lookup(notification_property.value, "notify_delay_after", null)

        }
      }
    }
  }

  dynamic "predicate" {
    for_each = var.predicate != null ? [var.predicate] : []
    content {
      logical = lookup(predicate.value, "logical", "AND")
      dynamic "conditions" {
        for_each = lookup(predicate.value, "conditions") != null ? lookup(predicate.value, "conditions") : []
        content {
          job_name         = lookup(conditions.value, "job_name", null)
          state            = lookup(conditions.value, "state", null)
          crawler_name     = lookup(conditions.value, "crawler_name", null)
          crawl_state      = lookup(conditions.value, "crawl_state", null)
          logical_operator = lookup(conditions.value, "logical_operator", "EQUALS")
        }
      }
    }

  }

  timeouts {
    create = lookup(var.timeouts, "create", "5m")
    delete = lookup(var.timeouts, "delete", "5m")
  }

}