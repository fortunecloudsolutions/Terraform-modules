output "arn" {
  description = "Amazon Resource Name (ARN) of Glue Workflow"
  value       = aws_glue_workflow.workflow.arn
}

output "id" {
  description = "Workflow name"
  value       = aws_glue_workflow.workflow.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_glue_workflow.workflow.tags_all
}
