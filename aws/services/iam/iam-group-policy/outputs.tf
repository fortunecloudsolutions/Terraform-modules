
output "id" {
  #{"type":"string","default":"dummy"}
  description = " The group policy ID."
  value       = module.aws_iam_group_policy.id
}

output "group" {
  #{"type":"string","default":"dummy"}
  description = " The group to which this policy applies."
  value       = module.aws_iam_group_policy.group
}

output "name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the policy."
  value       = module.aws_iam_group_policy.name
}

output "policy" {
  #{"type":"string","default":"dummy"}
  description = "The policy document attached to the group."
  value       = module.aws_iam_group_policy.policy
}