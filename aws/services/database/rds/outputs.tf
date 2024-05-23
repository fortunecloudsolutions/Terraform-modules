output "db_instance_address" {
  #{"type":"string","default":"matridbnew.csgcgjtsgsc5.us-east-2.rds.amazonaws.com"}
  description = "The hostname of the RDS instance. "
  value       = module.rds.db_instance_address
}

output "db_instance_arn" {
  #{"type":"string","default":"arn:aws:rds:us-east-2:123456789012:db:my-oracle-instance-1"}
  description = "The ARN of the RDS instance"
  value       = module.rds.db_instance_arn
}

output "db_instance_allocated_storage" {
  #{"type":"number","default":20}
  description = "The amount of allocated storage."
  value       = module.rds.db_instance_allocated_storage
}

output "db_instance_availability_zone" {
  #{"type":"string","default":"us-east-2a"}
  description = "The availability zone of the RDS instance"
  value       = module.rds.db_instance_availability_zone
}

output "db_instance_backup_retention_period" {
  #{"type":"number","default":20}
  description = "The backup retention period."
  value       = module.rds.db_instance_backup_retention_period
}

output "db_instance_backup_window" {
  #{"type":"string","default":"08:07-08:37"}
  description = "The backup window."
  value       = module.rds.db_instance_backup_window
}

output "db_instance_ca_cert_identifier" {
   #{"type":"string","default":"rds-ca-2019"}
  description = "Identifier of the CA certificate for the DB instance."
  value       = module.rds.db_instance_ca_cert_identifier
}

output "db_instance_db_name" {
  #{"type":"string","default":"dummy"}
  description = "The database name."
  value       = module.rds.db_instance_db_name
}

output "db_instance_domain" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = module.rds.db_instance_domain
}

output "db_instance_domain_iam_role_name" {
  #{"type":"string","default":"dummy"}
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = module.rds.db_instance_domain_iam_role_name
}


output "db_instance_endpoint" {
  #{"type":"string","default":"matridbnew.csgcgjtsgsc5.us-east-2.rds.amazonaws.com:1799"}
  description = "The connection endpoint in address:port format."
  value       = module.rds.db_instance_endpoint
}

output "db_instance_engine" {
   #{"type":"string","default":"sqlserver-ee"}
  description = "The database engine."
  value       = module.rds.db_instance_engine
}

output "db_instance_engine_version_actual" {
   #{"type":"string","default":"15.00.4198.2.v1"}
  description = "The running version of the database."
  value       = module.rds.db_instance_engine_version_actual
}

output "db_instance_hosted_zone_id" {
  #{"type":"string","default":"Z2XHWR1WZ565X2"}
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = module.rds.db_instance_hosted_zone_id
}

output "db_instance_id" {
  #{"type":"string","default":"matridbnew"}
  description = "The RDS instance ID"
  value       = module.rds.db_instance_id
}

output "db_instance_instance_class" {
   #{"type":"string","default":"db.t3.xlarge"}
  description = "The RDS instance class."
  value       = module.rds.db_instance_instance_class
}

output "db_instance_multi_az" {
   #{"type":"bool","default":true}
  description = "If the RDS instance is multi AZ enabled."
  value       = module.rds.db_instance_multi_az
}

# output "db_instance_name" {
#   description = "The database name"
#   value       = module.rds.name
# }

output "db_instance_port" {
  #{"type":"number","default":1799}
  description = "The database port"
  value       = module.rds.db_instance_port
}

output "db_instance_resource_id" {
  #{"type":"string","default":"db-CDVBADHOUXVSFYF6H3ZB57MKSE"}
  description = "The RDS Resource ID of this instance"
  value       = module.rds.db_instance_resource_id
}

output "db_instance_status" {
  #{"type":"string","default":"available"}
  description = "The RDS instance status"
  value       = module.rds.db_instance_status
}

output "db_instance_storage_encrypted" {
  #{"type":"bool","default":false}
  description = "Whether the DB instance is encrypted."
  value       = module.rds.db_instance_storage_encrypted
}

output "db_instance_username" {
  #{"type":"string","default":"MatriUser"}
  description = "The master username for the database"
  value       = module.rds.db_instance_username
}



