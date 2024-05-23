output "id" {
  description = "ARN that identifies the account setting."
  value       = aws_ecs_cluster_capacity_providers.ClusterCP.id
}
