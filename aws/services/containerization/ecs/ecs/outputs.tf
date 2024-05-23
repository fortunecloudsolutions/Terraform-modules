output "cluster_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the created ECS cluster."
  value       = module.cluster.cluster_id
}
output "instance_id" {
  #{"type":"string","default":"dummy"}
  description = "The name of the created ECS cluster."
  value       = module.cluster.cluster_name
}