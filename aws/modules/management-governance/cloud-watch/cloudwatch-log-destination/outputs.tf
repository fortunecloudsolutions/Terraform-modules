output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the log destination."
  value       = aws_cloudwatch_log_destination.cloudwatch_log_destination.arn
}

output "name" {
  description = "The Amazon Resource Name (ARN) specifying the log destination."
  value       = aws_cloudwatch_log_destination.cloudwatch_log_destination.name
}
