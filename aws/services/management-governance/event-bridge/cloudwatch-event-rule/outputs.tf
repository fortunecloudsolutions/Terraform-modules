output "id" {
  #{"type":"string","default":"arn:aws:events:us-east-2:046692759124:rule/test-event-rule"}
  description = "The name of the rule."
  value       = module.event_rule.id
}

output "arn" {
  #{"type":"string","default":"test-event-rule"}
  description = "The Amazon Resource Name (ARN) of the rule."
  value       = module.event_rule.arn
}

output "name" {
  #{"type":"string","default":"test-event-rule"}
  description = "The name of the rule."
  value       = module.event_rule.name
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.event_rule.tags_all
}