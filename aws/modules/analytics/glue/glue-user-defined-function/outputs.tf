output "id" {
  description = "The id of the Glue User Defined Function."
  value       = aws_glue_user_defined_function.user_defined_function.id
}

output "arn" {
  description = "The ARN of the Glue User Defined Function."
  value       = aws_glue_user_defined_function.user_defined_function.arn
}

output "name" {
  description = "The Name of the Glue User Defined Function."
  value       = aws_glue_user_defined_function.user_defined_function.name
}

/* output "create_date" {
  description = "The ARN of the Glue User Defined Function."
  value       = aws_glue_user_defined_function.user_defined_function.create_date
}
 */