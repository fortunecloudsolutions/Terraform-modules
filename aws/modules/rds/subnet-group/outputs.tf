output "subnet_group_id" {
  description = "The db subnet group name."
  value       = aws_db_subnet_group.rds.id

}
output "subnet_group_arn" {
  description = "The ARN of the db subnet group."
  value       = aws_db_subnet_group.rds.arn

}