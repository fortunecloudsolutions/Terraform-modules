output "asg_id" {
  #{"type":"string","default":"dummy"}
  description = "The autoscaling group id"
  value       = module.asg.asg_id
}

output "asg_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN for this AutoScaling Group"
  value       = module.asg.asg_arn
}

output "asg_vpc_zone_identifier" {
  #{"type":"string","default":"dummy"}
  description = "The VPC zone identifier"
  value       = module.asg.asg_vpc_zone_identifier
}

output "asg_name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the autoscale group"
  value       = module.asg.asg_name
}