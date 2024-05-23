output "service_arn" {
  #{"type":"string","default":"arn:aws:ecs:us-east-1:123456789012:cluster/my-cluster"}
  description = "The service arn"
  value       = module.services.service_arn
}

output "service_name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the service."
  value       = module.services.service_name
}

output "service_arn_name" {
  #{"type":"string","default":"dummy"}
  description = "The ARN name."
  value       = module.services.service_arn_name
}
output "service_iam_role" {
  #{"type":"string","default":"dummy"}
  description = "The service iam role."
  value       = module.services.service_iam_role
}
