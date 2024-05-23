output "arn" {
  description = "The Amazon Resource Name (ARN) of the event bus."
  value       = aws_cloudwatch_event_bus.event_bus.arn
}

output "name" {
  description = "The name of the event bus."
  value       = aws_cloudwatch_event_bus.event_bus.name
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_cloudwatch_event_bus.event_bus.tags_all
}
