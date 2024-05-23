output "arn" {
  description = "Full ARN of the repository."
  value       = aws_ecrpublic_repository.public_repository.arn
}

output "id" {
  description = "The repository name."
  value       = aws_ecrpublic_repository.public_repository.id
}

output "registry_id" {
  description = "The registry ID where the repository was created."
  value       = aws_ecrpublic_repository.public_repository.registry_id
}

output "repository_uri" {
  description = "The URI of the repository."
  value       = aws_ecrpublic_repository.public_repository.repository_uri
}
