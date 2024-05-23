output "id" {
  description = "The URL for the created Amazon SQS queue."
  value       = aws_sqs_queue.terraform_queue.id
}

output "arn" {
  description = "The ARN of the SQS queue"
  value       = aws_sqs_queue.terraform_queue.arn
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_sqs_queue.terraform_queue.tags_all
}

output "url" {
  description = "Same as id: The URL for the created Amazon SQS queue."
  value       = aws_sqs_queue.terraform_queue.url
}