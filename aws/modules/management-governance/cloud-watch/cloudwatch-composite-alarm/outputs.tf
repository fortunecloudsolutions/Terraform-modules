output "arn" {
  description = "The ARN of the composite alarm."
  value       = aws_cloudwatch_composite_alarm.composite_alarm.arn
}

output "id" {
  description = "The ID of the composite alarm resource, which is equivalent to its alarm_name."
  value       = aws_cloudwatch_composite_alarm.composite_alarm.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_cloudwatch_composite_alarm.composite_alarm.tags_all
}
