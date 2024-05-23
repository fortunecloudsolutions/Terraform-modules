output "id" {
  description = "The role policy ID, in the form of role_name:role_policy_name."
  value       = aws_iam_user_policy.lb_ro.id
}

output "name" {
  description = "The name of the policy."
  value       = aws_iam_user_policy.lb_ro.name
}





