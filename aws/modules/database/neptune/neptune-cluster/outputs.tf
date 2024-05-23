output "arn" {
  description = "The Neptune Cluster Amazon Resource Name (ARN)"
  value       = aws_neptune_cluster.cluster.arn
}

output "cluster_resource_id" {
  description = "The Neptune Cluster Resource ID"
  value       = aws_neptune_cluster.cluster.cluster_resource_id
}

output "cluster_members" {
  description = "List of Neptune Instances that are a part of this cluster"
  value       = aws_neptune_cluster.cluster.cluster_members
}

output "endpoint" {
  description = "The DNS address of the Neptune instance"
  value       = aws_neptune_cluster.cluster.endpoint
}

output "hosted_zone_id" {
  description = "The Route53 Hosted Zone ID of the endpoint"
  value       = aws_neptune_cluster.cluster.hosted_zone_id
}

output "id" {
  description = "The Neptune Cluster Identifier"
  value       = aws_neptune_cluster.cluster.id
}

output "reader_endpoint" {
  description = "A read-only endpoint for the Neptune cluster, automatically load-balanced across replicas"
  value       = aws_neptune_cluster.cluster.reader_endpoint
}

/* output "status" {
  description = "The Neptune instance status"
  value       = aws_neptune_cluster.cluster.status
}  */

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_neptune_cluster.cluster.tags_all
}

