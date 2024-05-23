output "arn" {
  #{"type":"string","default":"arn:aws:events:us-east-2:046692759124:event-bus/test-event-bus"}
  description = "The Amazon Resource Name (ARN) of the event bus."
  value       = module.event_bus.arn
}

output "name" {
  #{"type":"string","default":"test-event-bus"}
  description = "The name of the event bus."
  value       = module.event_bus.name
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.event_bus.tags_all
}
