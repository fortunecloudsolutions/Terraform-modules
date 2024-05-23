
output "id" {
  #{"type":"string","default":"dummy"}
  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = module.aws_iam_user_policy.id
}

output "name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the policy."
  value       = module.aws_iam_user_policy.name
}
