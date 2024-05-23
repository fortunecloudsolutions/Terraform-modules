output "option_group_id" {
  description = "The db option group name."
  value       = aws_db_option_group.rds.id

}
output "option_group_arn" {
  description = "The ARN of the db option group."
  value       = aws_db_option_group.rds.arn

}
