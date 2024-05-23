output "id" {
  description = " The group policy ID."
  value       = aws_iam_group_policy.default_policy.id
}

output "group" {
  description = " The group to which this policy applies."
  value       = aws_iam_group_policy.default_policy.group
}

output "name" {
  description = "The name of the policy."
  value       = aws_iam_group_policy.default_policy.name
}

output "policy" {
  description = "The policy document attached to the group."
  value       = aws_iam_group_policy.default_policy.policy
}



