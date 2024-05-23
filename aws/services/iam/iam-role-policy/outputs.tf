

output "id" {
  #{"type":"string","default":"dummy"}
  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = module.aws_iam_role_policy.id
}

output "role" {
  #{"type":"string","default":"dummy"}
  description = "The name of the role associated with the policy."
  value       = module.aws_iam_role_policy.role
}

output "name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the policy."
  value       = module.aws_iam_role_policy.name
}

output "policy" {
  #{"type":"string","default":"dummy"}
  description = "The policy document attached to the role. "
  value       = module.aws_iam_role_policy.policy
}



