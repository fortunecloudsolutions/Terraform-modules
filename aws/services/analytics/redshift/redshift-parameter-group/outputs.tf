output "arn" {
  #{"type":"string","default":"arn:aws:redshift:us-east-2:046692759124:parametergroup:test-parameter-group"}
  description = "Amazon Resource Name (ARN) of parameter group."
  value       = module.parameter_group.arn
}

output "id" {
  #{"type":"string","default":"test-parameter-group"}
  description = "The Redshift parameter group name."
  value       = module.parameter_group.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.parameter_group.tags_all
}

