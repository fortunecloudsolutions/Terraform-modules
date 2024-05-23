

output "arn" {
  #{"type":"string","default":"dummy"}
  description = " The ARN of the Flow Log."
  value       = module.aws_flow_log.arn
}

output "id" {
  #{"type":"string","default":"dummy"}
  description = " The Flow Log ID."
  value       = module.aws_flow_log.id
}








