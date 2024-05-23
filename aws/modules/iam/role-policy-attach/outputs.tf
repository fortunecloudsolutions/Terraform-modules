output "role_name" {
  description = "The role the policy should be applied to"
  value       = aws_iam_role_policy_attachment.role_policy.role
}

output "policy_arn" {
  description = "The ARN of the policy you want to apply"
  value       = aws_iam_role_policy_attachment.role_policy.policy_arn
}

