output "profile_id" {
  value = aws_iam_instance_profile.profile.id
}

output "profile_arn" {
  value = aws_iam_instance_profile.profile.arn
}
output "profile_name" {
  value = aws_iam_instance_profile.profile.name
}

output "unique_id" {
  value = aws_iam_instance_profile.profile.unique_id
}
