output "group_id" {
  description = "The group's ID"
  value       = aws_iam_group.group.id
}

output "group_arn" {
  description = "The ARN assigned by AWS for this group"
  value       = aws_iam_group.group.arn
}
output "group_name" {
  description = "The group's name"
  value       = aws_iam_group.group.name
}
output "group_unique_id" {
  description = "The unique ID assigned by AW"
  value       = aws_iam_group.group.unique_id
}


