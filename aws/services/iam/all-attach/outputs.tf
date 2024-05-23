output "policy_id" {
  #{"type":"string","default":"dummy"}
  description = "The policy's ID"
  value       = module.all_attach.policy_id
}

output "attach_name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the attachment"
  value       = module.all_attach.attach_name
}