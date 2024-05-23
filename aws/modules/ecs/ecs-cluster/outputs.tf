output "cluster_id" {
  description = "The ID of the created ECS cluster."
  value       = aws_ecs_cluster.cluster.id
}

output "tags_all" {
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_ecs_cluster.cluster.tags_all
}

output "cluster_arn" {
  description = "The ARN of the created ECS cluster."
  value       = aws_ecs_cluster.cluster.arn
}