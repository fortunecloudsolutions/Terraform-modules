output "asg_id" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.asg.id
}

output "asg_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.asg.arn
}

output "asg_vpc_zone_identifier" {
  description = "The VPC zone identifier"
  value       = aws_autoscaling_group.asg.vpc_zone_identifier
}

output "asg_name" {
  description = "The name of the autoscale group"
  value       = aws_autoscaling_group.asg.name
}