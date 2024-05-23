output "id" {
  #{"type":"string","default":"terraform-20210610221938224900000001"}
  description = "The neptune subnet group name."
  value       = module.subnet_group.id
}

output "arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:046692759124:subgrp:terraform-20210610221938224900000001"}
  description = "The ARN of the neptune subnet group."
  value       = module.subnet_group.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.subnet_group.tags_all
}
