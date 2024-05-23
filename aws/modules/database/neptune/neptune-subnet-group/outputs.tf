output "id" {
  description = "The neptune subnet group name."
  value       = aws_neptune_subnet_group.subnet_group.id
}

output "arn" {
  description = "The ARN of the neptune subnet group."
  value       = aws_neptune_subnet_group.subnet_group.arn
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_neptune_subnet_group.subnet_group.tags_all
}
