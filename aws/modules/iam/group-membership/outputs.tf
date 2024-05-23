output "membership_name" {
  description = " The name to identify the Group Membership"
  value       = aws_iam_group_membership.team.name
}

output "users" {
  description = " list of IAM User names"
  value       = aws_iam_group_membership.team.users
}
output "groups" {
  description = " IAM Group name"
  value       = aws_iam_group_membership.team.group
}

