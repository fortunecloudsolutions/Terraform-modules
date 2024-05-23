output "registry_id" {
  description = " The registry ID where the repository was created."
  value       = aws_ecr_replication_configuration.replication_configuration.registry_id
}