output "arn" {
  description = "Amazon Resource Name (ARN) of Glue Trigger"
  value       = aws_glue_trigger.trigger.arn
}

output "id" {
  description = "Trigger name"
  value       = aws_glue_trigger.trigger.id
}

output "state" {
  description = "The current state of the trigger."
  value       = aws_glue_trigger.trigger.state
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_glue_trigger.trigger.tags_all
}
