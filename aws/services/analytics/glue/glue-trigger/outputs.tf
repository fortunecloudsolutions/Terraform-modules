output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:trigger/test-trigger"}
  description = "Amazon Resource Name (ARN) of Glue Trigger"
  value       = module.trigger.arn
}

output "id" {
  #{"type":"string","default":"test-trigger"}
  description = "Trigger name"
  value       = module.trigger.id
}

output "state" {
  #{"type":"string","default":"CREATED"}
  description = "The current state of the trigger."
  value       = module.trigger.state
}

output "tags_all" {
  #{"type":"string","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.trigger.tags_all
}
