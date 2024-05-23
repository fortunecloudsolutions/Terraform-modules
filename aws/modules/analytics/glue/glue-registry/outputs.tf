output "arn" {
  description = "Amazon Resource Name (ARN) of Glue Registry."
  value       = aws_glue_registry.registry.arn
}

output "id" {
  description = "Amazon Resource Name (ARN) of Glue Registry."
  value       = aws_glue_registry.registry.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_glue_registry.registry.tags_all
}