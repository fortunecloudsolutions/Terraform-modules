output "scale_up_asg_policy_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN assigned by AWS to the scaling policy."
  value       = module.scale_up_asg_policy.arn
}

output "scale_up_asg_policy_name" {
  #{"type":"string","default":"dummy"}
  description = "The scaling policy's name."
  value       = module.scale_up_asg_policy.name
}

output "scale_up_asg_policy_type" {
  #{"type":"string","default":"dummy"}
  description = "The scaling policy's type."
  value       = module.scale_up_asg_policy.policy_type
}
