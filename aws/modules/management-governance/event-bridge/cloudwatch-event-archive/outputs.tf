output "arn" {
  description = "The Amazon Resource Name (ARN) of the event archive."
  value       = aws_cloudwatch_event_archive.event_archive.arn
}
