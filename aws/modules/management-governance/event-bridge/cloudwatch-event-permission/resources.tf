
resource "aws_cloudwatch_event_permission" "event_permission" {
  principal    = var.principal
  statement_id = var.statement_id
  action         =var.action
  event_bus_name=var.event_bus_name


 dynamic "condition" {
    for_each = var.condition != null ? [var.condition] : []
    content {
      key    = lookup(condition.value, "key")
      type   = lookup(condition.value, "type")
      value  = lookup(condition.value, "value")


    }
  }

}

