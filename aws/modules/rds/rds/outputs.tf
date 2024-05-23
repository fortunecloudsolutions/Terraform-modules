output "db_instance_address" {
  description = "The hostname of the RDS instance. "
  value       = aws_db_instance.rds.address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.rds.arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = aws_db_instance.rds.availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint in address:port format."
  value       = aws_db_instance.rds.endpoint
}


output "db_instance_id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.rds.id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = aws_db_instance.rds.resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = aws_db_instance.rds.status
}

output "db_instance_name" {
  description = "The database name"
  value       = aws_db_instance.rds.name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = aws_db_instance.rds.username
}



output "db_instance_port" {
  description = "The database port"
  value       = aws_db_instance.rds.port
}



output "db_parameter_group_arn" {
  description = "The ARN of the db parameter group"
  value       = aws_db_instance.rds.arn
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = aws_db_instance.rds.domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = aws_db_instance.rds.domain_iam_role_name
}
