output "role_id" {
  #{"type":"string","default":"dummy"}
  description = "The name of the role"
  value       = module.iam_role.role_id
}

output "role_arn" {
  #{"type":"string","default":"arn:aws:iam::123456789012:role/S3Access"}
  description = " The Amazon Resource Name (ARN) specifying the role"
  value       = module.iam_role.role_arn
}
output "role_name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the role"
  value       = module.iam_role.role_name
}
output "role_unique_id" {
  #{"type":"string","default":"dummy"}
  description = "The stable and unique string identifying the role"
  value       = module.iam_role.role_unique_id
}