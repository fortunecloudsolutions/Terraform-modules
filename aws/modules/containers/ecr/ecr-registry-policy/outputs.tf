output "registry_id" {
  description = " The registry ID where the repository was created."
  value       = aws_ecr_registry_policy.registry_policy.registry_id
}