output "launch_template_arn" {
  description = "The ARN of the Launch Template"
  value       = aws_launch_template.launch_template.arn
}

output "launch_template_id" {
  description = "The ID of the Launch Template"
  value       = aws_launch_template.launch_template.id
}

output "launch_template_latest_version" {
  description = "The latest_version of the Launch Template"
  value       = aws_launch_template.launch_template.latest_version
}