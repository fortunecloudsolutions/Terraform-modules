output "arn" {
  #{"type":"string","default":"arn:aws:ecr-public::046692759124:repository/test-public-ecr-repository"}
  description = "Full ARN of the repository."
  value       = module.public_repository.arn
}

output "id" {
  #{"type":"string","default":"test-public-ecr-repository"}
  description = "The repository name."
  value       = module.public_repository.id
}

output "registry_id" {
  #{"type":"string","default":"046692759124"}
  description = "The registry ID where the repository was created."
  value       = module.public_repository.registry_id
}

output "repository_uri" {
  #{"type":"string","default":"public.ecr.aws/a4r8z2g3/test-public-ecr-repository"}
  description = "The URI of the repository."
  value       = module.public_repository.repository_uri
}
