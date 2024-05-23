output "arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:cluster:test-cluster"}
  description = "The Neptune Cluster Amazon Resource Name (ARN)"
  value       = module.cluster.arn
}

output "cluster_resource_id" {
  #{"type":"string","default":"cluster-MBIAUA5R5K7PKJUKCOERGNCPI4"}
  description = "The Neptune Cluster Resource ID"
  value       = module.cluster.cluster_resource_id
}

output "cluster_members" {
  #{"type":"list","default":"[]"}
  description = "List of Neptune Instances that are a part of this cluster"
  value       = module.cluster.cluster_members
}

output "endpoint" {
  #{"type":"string","default":"test-cluster.cluster-csgcgjtsgsc5.us-east-2.neptune.amazonaws.com"}
  description = "The DNS address of the Neptune instance"
  value       = module.cluster.endpoint
}

output "hosted_zone_id" {
  #{"type":"string","default":"Z18MU2VX5LLW0S"}
  description = "The Route53 Hosted Zone ID of the endpoint"
  value       = module.cluster.hosted_zone_id
}

output "id" {
  #{"type":"string","default":"test-cluster"}
  description = "The Neptune Cluster Identifier"
  value       = module.cluster.id
}

output "reader_endpoint" {
  #{"type":"string","default":"test-cluster.cluster-ro-csgcgjtsgsc5.us-east-2.neptune.amazonaws.com"}
  description = "A read-only endpoint for the Neptune cluster, automatically load-balanced across replicas"
  value       = module.cluster.reader_endpoint
}

/* output "status" {
  #{"type":"string","default":"dummy"}
  description = "The Neptune instance status"
  value       = module.cluster.status
}  */
 
output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cluster.tags_all
}

