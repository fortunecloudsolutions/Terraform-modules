resource "aws_cloudwatch_event_rule" "event_rule" {
  name                = var.name
  description         = var.description
  name_prefix         = var.name_prefix
  schedule_expression = var.schedule_expression
  event_bus_name      = var.event_bus_name
  event_pattern       = var.event_pattern
  role_arn            = var.role_arn
  is_enabled          = var.is_enabled
  tags                = var.tags

}