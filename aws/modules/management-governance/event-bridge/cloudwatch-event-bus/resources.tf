resource "aws_cloudwatch_event_bus" "event_bus" {
  name              = var.name
  event_source_name = var.event_source_name
  tags=var.tags
}