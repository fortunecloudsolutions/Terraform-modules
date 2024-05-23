output "id" {
  #{"type":"string","default":"https://sqs.us-east-2.amazonaws.com/046692759124/sqs_queue_test"}
  description = "The URL for the created Amazon SQS queue."
  value       = module.terraform_queue.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:sqs:us-east-2:046692759124:sqs_queue_test"}
  description = "The ARN of the SQS queue"
  value       = module.terraform_queue.arn
}

output "tags_all" {
  #{"type":"maps","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.terraform_queue.tags_all
}

output "url" {
  #{"type":"string","default":"https://sqs.us-east-2.amazonaws.com/046692759124/sqs_queue_test"}
  description = "The URL for the created Amazon SQS queue."
  value       = module.terraform_queue.url
}
