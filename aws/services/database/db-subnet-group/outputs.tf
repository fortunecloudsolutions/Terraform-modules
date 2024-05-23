output "subnet_group_id" {
  #{"type":"string","default":"mssql-subnet-group"}
  description = "The db subnet group name."
  value       = module.db-subnet-group.subnet_group_id

}

output "subnet_group_arn" {
  #{"type":"string","default":"arn:aws:ecs:us-west-2:123456789012:subgrp:mssql-subnet-group"}
  description = "The ARN of the db subnet group."
  value       = module.db-subnet-group.subnet_group_arn

}