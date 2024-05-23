
output "arn" {
  #{"type":"string","default":"dummy"}
  description = " Indicates whether passwords in the account expire. Returns true if max_password_age contains a value greater than 0. Returns false if it is 0 or not present."
  value       = module.aws_iam_server_certificate.arn
}

output "id" {
  #{"type":"string","default":"dummy"}
  description = " Indicates whether passwords in the account expire. Returns true if max_password_age contains a value greater than 0. Returns false if it is 0 or not present."
  value       = module.aws_iam_server_certificate.id
}

output "name" {
  #{"type":"string","default":"dummy"}
  description = " Indicates whether passwords in the account expire. Returns true if max_password_age contains a value greater than 0. Returns false if it is 0 or not present."
  value       = module.aws_iam_server_certificate.name
}





