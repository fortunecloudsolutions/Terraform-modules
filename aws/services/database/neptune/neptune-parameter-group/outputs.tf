output "id" {
  #{"type":"string","default":"tst-pg"}
  description = "The neptune parameter group name."
  value       = module.parameter_group.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:pg:tst-pg"}
  description = "The ARN of the neptune parameter group."
  value       = module.parameter_group.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.parameter_group.tags_all
}

