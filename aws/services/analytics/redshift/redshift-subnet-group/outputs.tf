output "arn" {
  #{"type":"string","default":"arn:aws:redshift:us-east-2:046692759124:subnetgroup:test-subnet-group"}
  description = "Amazon Resource Name (ARN) of the Redshift Subnet group name"
  value       = module.subnet_group.arn
}

output "id" {
  #{"type":"string","default":"test-subnet-group"}
  description = "The Redshift Subnet group ID."
  value       = module.subnet_group.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "The Redshift Subnet group ID."
  value       = module.subnet_group.tags_all
}

