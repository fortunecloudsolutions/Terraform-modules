output "id" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the subscription"
  value       = module.topic-subscription.id
}

output "protocol" {
  #{"type":"string","default":"lt-substitute"}
  description = "The protocol being used"
  value       = module.topic-subscription.protocol
}

output "endpoint" {
  #{"type":"string","default":"lt-substitute"}
  description = "The full endpoint to send data to (SQS ARN, HTTP(S) URL, Application ARN, SMS number, etc.)"
  value       = module.topic-subscription.endpoint
}