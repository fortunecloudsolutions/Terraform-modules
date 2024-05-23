output "arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN assigned by AWS for this user"
  value       = module.users.arn
}

output "unique_id" {
  #{"type":"string","default":"dummy"}
  description = "The unique ID assigned by AWS"
  value       = module.users.unique_id
}
output "username" {
  #{"type":"string","default":"dummy"}
  description = "The IAM user's name"
  value       = module.users.username
}

output "password" {
  #{"type":"string","default":"ZHVtbXk="}
  description = "The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import"
  value       = module.users.password
}