
output "id" {

  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = aws_iam_role_policy.test_policy.id
}

output "role" {
  description = "The name of the role associated with the policy."
  value       = aws_iam_role_policy.test_policy.role
}

output "name" {
  description = "The name of the policy."
  value       = aws_iam_role_policy.test_policy.name
}

output "policy" {

  description = "The policy document attached to the role. "
  value       = aws_iam_role_policy.test_policy.policy
}



