output "cluster" {
  #{"type":"string","default":"dummy"}
  description = "Amazon Resource Name (ARN) of cluster which the service runs on."
  value       = module.service.cluster
}
output "desired_count" {
  #{"type":"string","default":"dummy"}
  description = "Number of instances of the task definition."
  value       = module.service.desired_count
}
output "iam_role" {
  #{"type":"string","default":"dummy"}
  description = "ARN of IAM role used for ELB."
  value       = module.service.iam_role
}
output "id" {
  #{"type":"string","default":"dummy"}
  description = "ARN that identifies the service."
  value       = module.service.id
}
output "name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the service."
  value       = module.service.name
}
output "tags_all" {
  #{"type":"string","default":"dummy"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.service.tags_all
}