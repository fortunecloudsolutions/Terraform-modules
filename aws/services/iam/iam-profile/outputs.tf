output "profile_id" {
  #{"type":"string","default":"dummy"}
  description = "The policy's ID"
  value       = module.iam_profile.profile_id
}

output "profile_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN assigned by AWS to this policy."
  value       = module.iam_profile.profile_arn
}
output "profile_name" {
  #{"type":"string","default":"dummy"}
  description = " The name of the policy"
  value       = module.iam_profile.profile_name
}

output "unique_id" {
  #{"type":"string","default":"dummy"}
  description = "The policy document"
  value       = module.iam_profile.unique_id
}
