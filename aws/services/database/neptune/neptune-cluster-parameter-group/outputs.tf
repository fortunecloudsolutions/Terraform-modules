output "id" {
  #{"type":"string","default":"test-parameter-group"}
  description = "The neptune cluster parameter group name."
  value       = module.cluster_parameter_group.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:cluster-pg:test-parameter-group"}
  description = "The ARN of the neptune cluster parameter group."
  value       = module.cluster_parameter_group.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cluster_parameter_group.tags_all
}

