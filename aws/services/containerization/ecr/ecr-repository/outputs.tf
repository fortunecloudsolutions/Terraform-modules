output "arn" {
  #{"type":"string","default":"arn:aws:ecr:us-east-2:046692759124:repository/test-ecr-repository"}
  description = "Full ARN of the repository."
  value       = module.ecr_repository.arn
}

output "name" {
  #{"type":"string","default":"test-ecr-repository"}
  description = "Full name of the repository."
  value       = module.ecr_repository.name
}

output "registry_id" {
  #{"type":"string","default":"046692759124"}
  description = "The registry ID where the repository was created."
  value       = module.ecr_repository.registry_id
}

output "repository_url" {
  #{"type":"string","default":"046692759124.dkr.ecr.us-east-2.amazonaws.com/test-ecr-repository"}
  description = "The URL of the repository (in the form aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName)."
  value       = module.ecr_repository.repository_url
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.ecr_repository.tags_all
}


