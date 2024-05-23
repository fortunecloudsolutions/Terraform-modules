output "role_name" {
  #{"type":"string","default":"dummy"}
  description = "The role the policy should be applied to"
  value       = module.rolepolicy.role_name
}

output "policy_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the policy you want to apply"
  value       = module.rolepolicy.policy_arn
}