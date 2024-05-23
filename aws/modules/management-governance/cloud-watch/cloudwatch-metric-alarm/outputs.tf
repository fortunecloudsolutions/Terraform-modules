output "arn" {
  description = "The ARN of the CloudWatch Metric Alarm."
  value       = aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.arn
}

output "alarm_name" {
  description = "The name of the CloudWatch Metric Alarm."
  value       = aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.alarm_name
}

output "id" {
  description = "The ID of the health check."
  value       = aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_cloudwatch_metric_alarm.cloudwatch_metric_alarm.tags_all
}


