output "policy_id" {
  #{"type":"string","default":"dummy"}
  description = "The policy's ID"
  value       = module.iam_policy.policy_id
}

output "policy_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN assigned by AWS to this policy."
  value       = module.iam_policy.policy_arn
}
output "policy_name" {
  #{"type":"string","default":"dummy"}
  description = " The name of the policy"
  value       = module.iam_policy.policy_name
}
output "policy" {
  #{"type":"string","default":"dummy"}
  description = "The policy document"
  value       = module.iam_policy.policy
}
