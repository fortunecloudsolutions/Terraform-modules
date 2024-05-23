output "dbparam_id" {
  description = "The db parameter group name."
  value       = aws_db_parameter_group.rds.id

}
output "dbparam_arn" {
  description = " The ARN of the db parameter group.."
  value       = aws_db_parameter_group.rds.arn

}

