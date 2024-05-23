

output "id" {
  #{"type":"string","default":"dummy"}
  description = "The combination of service_name and user_name as such: service_name:user_name:service_specific_credential_id."
  value       = module.aws_iam_service_specific_credential.id
}

output "service_password" {
  #{"type":"string","default":"dummy"}
  description = "he generated password for the service-specific credential."
  value       = module.aws_iam_service_specific_credential.service_password
  sensitive   = true
}

output "service_user_name" {
  #{"type":"string","default":"dummy"}
  description = " The generated user name for the service-specific credential."
  value       = module.aws_iam_service_specific_credential.service_user_name
}

output "service_specific_credential_id" {
  #{"type":"string","default":"dummy"}
  description = " The unique identifier for the service-specific credential."
  value       = module.aws_iam_service_specific_credential.service_specific_credential_id
}







