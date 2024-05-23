output "db_instance_address" {
  description = "The hostname of the RDS instance. "
  value       = aws_db_instance.rds.address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.rds.arn
}

output "db_instance_allocated_storage" {
  description = "The amount of allocated storage."
  value       = aws_db_instance.rds.allocated_storage
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = aws_db_instance.rds.availability_zone
}

output "db_instance_backup_retention_period" {
  description = "The backup retention period."
  value       = aws_db_instance.rds.backup_retention_period
}

output "db_instance_backup_window" {
  description = "The backup window."
  value       = aws_db_instance.rds.backup_window
}

output "db_instance_ca_cert_identifier" {
  description = "Identifier of the CA certificate for the DB instance."
  value       = aws_db_instance.rds.ca_cert_identifier
}

output "db_instance_db_name" {
  description = "The database name."
  value       = aws_db_instance.rds.db_name
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = aws_db_instance.rds.domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = aws_db_instance.rds.domain_iam_role_name
}


output "db_instance_endpoint" {
  description = "The connection endpoint in address:port format."
  value       = aws_db_instance.rds.endpoint
}

output "db_instance_engine" {
  description = "The database engine."
  value       = aws_db_instance.rds.engine
}

output "db_instance_engine_version_actual" {
  description = "The running version of the database."
  value       = aws_db_instance.rds.engine_version_actual
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)."
  value       = aws_db_instance.rds.hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.rds.id
}

output "db_instance_instance_class" {
  description = "The RDS instance class."
  value       = aws_db_instance.rds.instance_class
}

output "db_instance_multi_az" {
  description = "If the RDS instance is multi AZ enabled."
  value       = aws_db_instance.rds.multi_az
}

# output "db_instance_name" {
#   description = "The database name"
#   value       = aws_db_instance.rds.name
# }

output "db_instance_port" {
  description = "The database port"
  value       = aws_db_instance.rds.port
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = aws_db_instance.rds.resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = aws_db_instance.rds.status
}

output "db_instance_storage_encrypted" {
  description = "Whether the DB instance is encrypted."
  value       = aws_db_instance.rds.storage_encrypted
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.rds.username
}



