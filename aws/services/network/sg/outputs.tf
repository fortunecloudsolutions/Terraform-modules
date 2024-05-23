output "sg_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the security group"
  value       = module.sg.sg_id
}

output "sg_arn" {
  #{"type":"string","default":"arn:aws:ec2:sa-east-1:111122223333:security-group/sg-918298001"}
  description = "The ARN of the security group"
  value       = module.sg.sg_arn
}