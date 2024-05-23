

output "id" {
  description = "The combination of service_name and user_name as such: service_name:user_name:service_specific_credential_id."
  value       = aws_iam_service_specific_credential.test_cred.id
}

output "service_password" {
  description = "he generated password for the service-specific credential."
  value       = aws_iam_service_specific_credential.test_cred.service_password
  sensitive   = true
}


output "service_user_name" {
  description = " The generated user name for the service-specific credential."
  value       = aws_iam_service_specific_credential.test_cred.service_user_name
}

output "service_specific_credential_id" {
  description = " The unique identifier for the service-specific credential."
  value       = aws_iam_service_specific_credential.test_cred.service_specific_credential_id
}







