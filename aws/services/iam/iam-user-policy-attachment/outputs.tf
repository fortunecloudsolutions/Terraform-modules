
output "user" {
  #{"type":"string","default":"dummy"}
  description = "The role the policy should be applied to"
  value       = module.aws_iam_user_policy_attachment.user
}

output "policy_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the policy you want to apply"
  value       = module.aws_iam_user_policy_attachment.policy_arn
}