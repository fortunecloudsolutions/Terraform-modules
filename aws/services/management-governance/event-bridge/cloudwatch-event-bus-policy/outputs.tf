output "id" {
  #{"type":"string","default":"test-event-bus"}
  description = "The name of the EventBridge event bus."
  value       = module.event_bus_policy.id
}


