output "arn" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:schema/test-registry/test-schema"}
  description = "Amazon Resource Name (ARN) of the schema."
  value       = module.schema.arn
}

output "id" {
  #{"type":"string","default":"arn:aws:glue:us-east-2:046692759124:schema/test-registry/test-schema"}
  description = "Amazon Resource Name (ARN) of the schema."
  value       = module.schema.id
}

output "registry_name" {
  #{"type":"string","default":"test-registry"}
  description = "The name of the Glue Registry."
  value       = module.schema.registry_name
}

output "latest_schema_version" {
  #{"type":"number","default":"1"}
  description = "The latest version of the schema associated with the returned schema definition."
  value       = module.schema.latest_schema_version
}

output "next_schema_version" {
  #{"type":"number","default":"2"}
  description = "The next version of the schema associated with the returned schema definition."
  value       = module.schema.next_schema_version
}

output "schema_checkpoint" {
  #{"type":"number","default":"1"}
  description = "The version number of the checkpoint (the last time the compatibility mode was changed)."
  value       = module.schema.schema_checkpoint
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.schema.tags_all
}

