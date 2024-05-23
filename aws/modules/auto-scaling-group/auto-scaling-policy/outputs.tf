output "arn" {
  description = "The ARN assigned by AWS to the scaling policy."
  value       = aws_autoscaling_policy.asg_policy.arn
}

output "name" {
  description = "The scaling policy's name."
  value       = aws_autoscaling_policy.asg_policy.name
}

output "policy_type" {
  description = "The scaling policy's type."
  value       = aws_autoscaling_policy.asg_policy.policy_type
}
