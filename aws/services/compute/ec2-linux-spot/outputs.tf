output "public_instance_ip" {
  #{"type":"string","default":"dummy"}
  description = "The public IP address assigned to the instance, if applicable."
  value       = module.ec2.public_instance_ip
}
output "spot_request_id" {
  #{"type":"string","default":"dummy"}
  description = "The instance ID."
  value       = module.ec2.spot_request_id
}
output "spot_instance_id" {
  #{"type":"string","default":"dummy"}
  description = "The Instance ID (if any) that is currently fulfilling the Spot Instance request."
  value       = module.ec2.spot_instance_id
}
output "public_dns" {
  #{"type":"string","default":"dummy"}
  description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = module.ec2.public_dns
}
output "availability_zone" {
  #{"type":"string","default":"us-east-2a"}
  description = "The availability zone of the instance"
  value       = module.ec2.availability_zone
}
output "private_ip" {
  #{"type":"string","default":"dummy"}
  description = "The private ip of the instance"
  value       = module.ec2.private_ip
}
