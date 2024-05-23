output "policy_id" {
  description = "The policy's ID"
  value       = aws_iam_policy.policy.id
}

output "policy_arn" {
  description = "The ARN assigned by AWS to this policy."
  value       = aws_iam_policy.policy.arn
}
output "policy_name" {
  description = " The name of the policy"
  value       = aws_iam_policy.policy.name
}
output "policy" {
  description = "The policy document"
  value       = aws_iam_policy.policy.policy
}

