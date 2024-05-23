output "arn" {
  description = "The Neptune Cluster Endpoint Amazon Resource Name (ARN)."
  value       = aws_neptune_cluster_endpoint.cluster_endpoint.arn
}

output "endpoint" {
  description = "The DNS address of the endpoint."
  value       = aws_neptune_cluster_endpoint.cluster_endpoint.endpoint
}

output "id" {
  description = "The Neptune Cluster Endpoint Identifier."
  value       = aws_neptune_cluster_endpoint.cluster_endpoint.id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_neptune_cluster_endpoint.cluster_endpoint.tags_all
}

