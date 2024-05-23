output "cloudwatch_metric_id" {
  description = "The ID of the health check"
  value       = aws_cloudwatch_metric_alarm.cloudwatch_metric.id
}

output "cloudwatch_metric_arn" {
  description = "The ARN of the cloudwatch metric alarm"
  value       = aws_cloudwatch_metric_alarm.cloudwatch_metric.arn
}
