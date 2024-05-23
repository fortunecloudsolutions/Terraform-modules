output "user" {
  description = "The name of the IAM User"
  value       = aws_iam_user_group_membership.add_groups.user
}

output "group" {
  description = "The list of IAM Groups"
  value       = aws_iam_user_group_membership.add_groups.groups
}