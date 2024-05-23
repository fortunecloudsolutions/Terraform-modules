output "arn" {
  description = " The Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_service_linked_role.elasticbeanstalk.arn
}

output "id" {
  description = " The Amazon Resource Name (ARN) of the role."
  value       = aws_iam_service_linked_role.elasticbeanstalk.id
}

output "name" {
  description = " The name of the role."
  value       = aws_iam_service_linked_role.elasticbeanstalk.name
}

output "create_date" {
  description = " The creation date of the IAM role."
  value       = aws_iam_service_linked_role.elasticbeanstalk.create_date
}

output "path" {
  description = " The path of the role."
  value       = aws_iam_service_linked_role.elasticbeanstalk.path
}

output "unique_id" {
  description = " The stable and unique string identifying the role."
  value       = aws_iam_service_linked_role.elasticbeanstalk.unique_id
}







