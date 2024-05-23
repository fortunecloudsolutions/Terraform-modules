
output "db_instance_address" {
  description = "The address of the RDS instance"
  #{"type":"string","default":"1.1.1.1"}
  value = module.rds.db_instance_address
}

output "db_instance_arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:123456789012:db:my-mssql-instance-1"}
  description = "The ARN of the RDS instance"
  value       = module.rds.db_instance_arn
}

output "db_instance_availability_zone" {
  #{"type":"string","default":"us-east-2"}
  description = "The availability zone of the RDS instance"
  value       = module.rds.db_instance_availability_zone
}

output "db_instance_endpoint" {
  #{"type":"string","default":"db1.123456789012.us-east-1.rds.amazonaws.com"}
  description = "The connection endpoint"
  value       = module.rds.db_instance_endpoint
}


output "db_instance_id" {
  #{"type":"string","default":"dummy"}
  description = "The RDS instance ID"
  value       = module.rds.db_instance_id
}

output "db_instance_resource_id" {
  #{"type":"string","default":"dummy"}
  description = "The RDS Resource ID of this instance"
  value       = module.rds.db_instance_resource_id
}

output "db_instance_status" {
  #{"type":"string","default":"dummy"}
  description = "The RDS instance status"
  value       = module.rds.db_instance_status
}

output "db_instance_name" {
  #{"type":"string","default":"dummy"}
  description = "The database name"
  value       = module.rds.db_instance_name
}

output "db_instance_username" {
  #{"type":"string","default":"dummy"}
  description = "The master username for the database"
  value       = module.rds.db_instance_username
}



output "db_subnet_group_id" {
  #{"type":"string","default":"dummy"}
  description = "The db subnet group name"
  value       = module.subnet_group.subnet_group_id
}


output "db_parameter_group_id" {
  #{"type":"string","default":"dummy"}
  description = "The db parameter group id"
  value       = module.db_parameter.dbparam_id
}
output "option_group_id" {
  #{"type":"string","default":"dummy"}
  description = "The option group id"
  value       = module.option_group.option_group_id
}
output "db_parameter_group_arn" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the db parameter group"
  value       = module.rds.db_parameter_group_arn
}


output "db_instance_domain_iam_role_name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = module.rds.db_instance_domain_iam_role_name
}
