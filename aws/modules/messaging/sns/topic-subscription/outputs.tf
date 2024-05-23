output "id" {
  description = "The ARN of the subscription"
  value       = aws_sns_topic_subscription.topic_subscription.id
}

output "protocol" {
  description = "The protocol being used"
  value       = aws_sns_topic_subscription.topic_subscription.protocol
}

output "endpoint" {
  description = "The full endpoint to send data to (SQS ARN, HTTP(S) URL, Application ARN, SMS number, etc.)"
  value       = aws_sns_topic_subscription.topic_subscription.endpoint
}
