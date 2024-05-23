resource "aws_cloudwatch_event_bus_policy" "event_bus_policy" {
  policy             = var.policy
  event_bus_name = var.event_bus_name
  
}