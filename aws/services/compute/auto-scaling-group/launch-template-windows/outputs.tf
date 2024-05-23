output "launch_template_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the Launch Template"
  value       = module.launch_template.launch_template_arn
}

output "launch_template_id" {
  #{"type":"string","default":"lt-substitute"}
  description = "The ID of the Launch Template"
  value       = module.launch_template.launch_template_id
}

output "launch_template_latest_version" {
  #{"type":"string","default":"1"}
  description = "The latest_version of the Launch Template"
  value       = module.launch_template.launch_template_latest_version
}
