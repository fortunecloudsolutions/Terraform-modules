output "arn" {
  description = "Amazon Resource Name (ARN) of the Redshift Subnet group name"
  value       = aws_redshift_subnet_group.subnet_group.arn
}

output "id" {
  description = "The Redshift Subnet group ID."
  value       = aws_redshift_subnet_group.subnet_group.id
}

output "tags_all" {
  description = "The Redshift Subnet group ID."
  value       = aws_redshift_subnet_group.subnet_group.tags_all
}

