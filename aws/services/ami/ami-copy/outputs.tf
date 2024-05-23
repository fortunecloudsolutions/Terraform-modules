
output "arn" {
  #{"type":"string","default":"dummy"}
  description = "ARN of the AMI."
  value       = module.aws_ami_copy.arn
}

output "id" {
  #{"type":"string","default":"dummy"}
  description = "ID of the created AMI."
  value       = module.aws_ami_copy.id
}
