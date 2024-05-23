output "arn" {
  description = "The name of the CloudWatch log resource policy"
  value       = aws_cloudwatch_log_stream.cloudwatch_log_stream.arn
}


