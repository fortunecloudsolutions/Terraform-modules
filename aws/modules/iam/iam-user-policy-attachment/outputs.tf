output "user" {
  description = "The role the policy should be applied to"
  value       = aws_iam_user_policy_attachment.test-attach.user
}

output "policy_arn" {
  description = "The ARN of the policy you want to apply"
  value       = aws_iam_user_policy_attachment.test-attach.policy_arn
}

