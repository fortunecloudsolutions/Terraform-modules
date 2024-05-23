output "id" {
  description = "The neptune parameter group name."
  value       = aws_neptune_parameter_group.parameter_group.id
}

output "arn" {
  description = "The ARN of the neptune parameter group."
  value       = aws_neptune_parameter_group.parameter_group.arn
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_neptune_parameter_group.parameter_group.tags_all
}

