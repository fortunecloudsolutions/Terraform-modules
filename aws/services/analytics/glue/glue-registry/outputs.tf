output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:registry/test-registry"}
  description = "Amazon Resource Name (ARN) of Glue Registry."
  value       = module.registry.arn
}

output "id" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:registry/test-registry"}
  description = "Amazon Resource Name (ARN) of Glue Registry."
  value       = module.registry.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.registry.tags_all
}