output "launch_configuration_name" {
  description = "The name of the launch configuration for the ECS container instances."
  value       = aws_launch_configuration.cluster.name
}