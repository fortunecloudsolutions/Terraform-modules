output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:workflow/test-workflow"}
  description = "Amazon Resource Name (ARN) of Glue Workflow"
  value       = module.workflow.arn
}

output "id" {
  #{"type":"string","default":"test-workflow"}
  description = "Workflow name"
  value       = module.workflow.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.workflow.tags_all
}
