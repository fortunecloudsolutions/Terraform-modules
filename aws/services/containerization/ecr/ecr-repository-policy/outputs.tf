output "repository" {
  #{"type":"string","default":"test-ecr-repository"}
  description = "The name of the repository."
  value       = module.repository_policy.repository
}

output "registry_id" {
  #{"type":"string","default":"046692759124"}
  description = " The registry ID where the repository was created."
  value       = module.repository_policy.registry_id
}