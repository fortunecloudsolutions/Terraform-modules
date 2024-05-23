output "arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:cluster-endpoint:test-endpoint"}
  description = "The Neptune Cluster Endpoint Amazon Resource Name (ARN)."
  value       = module.cluster_endpoint.arn
}

output "endpoint" {
  #{"type":"string","default":"test-endpoint.cluster-custom-csgcgjtsgsc5.us-east-2.neptune.amazonaws.com"}
  description = "The DNS address of the endpoint."
  value       = module.cluster_endpoint.endpoint
}

output "id" {
  #{"type":"string","default":"test-cluster:test-endpoint"}
  description = "The Neptune Cluster Endpoint Identifier."
  value       = module.cluster_endpoint.id
}

output "tags_all" {
  #{"type":"string","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cluster_endpoint.tags_all
}

