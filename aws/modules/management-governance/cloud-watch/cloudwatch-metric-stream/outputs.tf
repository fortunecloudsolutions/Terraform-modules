output "arn" {
  description = "ARN of the metric stream."
  value       = aws_cloudwatch_metric_stream.cloudwatch_metric_stream.arn
}

output "creation_date" {
  description = "Date and time in RFC3339 format that the metric stream was created."
  value       = aws_cloudwatch_metric_stream.cloudwatch_metric_stream.creation_date
}

output "last_update_date" {
  description = "Date and time in RFC3339 format that the metric stream was last updated."
  value       = aws_cloudwatch_metric_stream.cloudwatch_metric_stream.last_update_date
}

output "state" {
  description = "State of the metric stream. Possible values are running and stopped."
  value       = aws_cloudwatch_metric_stream.cloudwatch_metric_stream.state
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_cloudwatch_metric_stream.cloudwatch_metric_stream.tags_all
}
