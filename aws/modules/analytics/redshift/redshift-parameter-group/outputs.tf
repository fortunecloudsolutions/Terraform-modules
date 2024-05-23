output "arn" {
  description = "Amazon Resource Name (ARN) of parameter group."
  value       = aws_redshift_parameter_group.parameter_group.arn
}

output "id" {
  description = "The Redshift parameter group name."
  value       = aws_redshift_parameter_group.parameter_group.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_redshift_parameter_group.parameter_group.tags_all
}

