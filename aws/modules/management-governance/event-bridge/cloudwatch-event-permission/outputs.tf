output "id" {
  description = "The statement ID of the EventBridge permission."
  value       = aws_cloudwatch_event_permission.event_permission.id
}
