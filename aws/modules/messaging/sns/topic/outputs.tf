output "sns_id" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.topic.id
}

output "sns_arn" {
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value       = aws_sns_topic.topic.arn
}
