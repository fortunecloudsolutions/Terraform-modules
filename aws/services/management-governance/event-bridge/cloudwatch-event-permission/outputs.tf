output "id" {
  #{"type":"string","default":"test-event-bus/DevAccountAccess"}
  description = "The statement ID of the EventBridge permission."
  value       = module.event_permission.id
}
