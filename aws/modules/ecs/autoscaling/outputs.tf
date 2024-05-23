
output "autoscaling_group_name" {
  description = "The name of the autoscaling group for the ECS container instances."
  value       = aws_autoscaling_group.cluster.name
}