output "arn" {
  description = "The Amazon Resource Name (ARN) of the event API Destination."
  value       = aws_cloudwatch_event_api_destination.event_api_destination.arn
}
