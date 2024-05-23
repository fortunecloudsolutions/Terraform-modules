output "cluster_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the created ECS cluster."
  value       = module.cluster.cluster_id
}
output "tags_all" {
  #{"type":"string","default":"dummy"}
  description = "Map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cluster.tags_all
}
output "cluster_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the created ECS cluster."
  value       = module.cluster.cluster_arn
}