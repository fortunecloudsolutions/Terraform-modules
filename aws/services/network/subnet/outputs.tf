output "subnet_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the subnet"
  value       = module.subnet.subnet_id
}

output "subnet_arn" {
  #{"type":"string","default":"arn:aws:ec2:us-east-2:111122223333:subnet/subnet-8EXAMPLE"}
  description = "The ARN of the subnet."
  value       = module.subnet.subnet_arn
}

