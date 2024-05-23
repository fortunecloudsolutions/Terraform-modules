output "arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the AMI."
  value       = module.ami.arn
}

output "id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the created AMI."
  value       = module.ami.id
}

