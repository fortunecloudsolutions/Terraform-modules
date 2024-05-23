
output "arn" {
  #{"type":"string","default":"dummy"}
  description = " The Amazon Resource Name (ARN) specifying the role."
  value       = module.aws_iam_service_linked_role.arn
}

output "id" {
  #{"type":"string","default":"dummy"}
  description = " The Amazon Resource Name (ARN) of the role."
  value       = module.aws_iam_service_linked_role.id
}

output "name" {
  #{"type":"string","default":"dummy"}
  description = " The name of the role."
  value       = module.aws_iam_service_linked_role.name
}

output "create_date" {
  #{"type":"string","default":"dummy"}
  description = " The creation date of the IAM role."
  value       = module.aws_iam_service_linked_role.create_date
}

output "path" {
  #{"type":"string","default":"dummy"}
  description = " The path of the role."
  value       = module.aws_iam_service_linked_role.path
}

output "unique_id" {
  #{"type":"string","default":"dummy"}
  description = " The stable and unique string identifying the role."
  value       = module.aws_iam_service_linked_role.unique_id
}












