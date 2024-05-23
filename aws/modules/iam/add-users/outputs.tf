output "arn" {
  description = "The ARN assigned by AWS for this user"
  value       = aws_iam_user.aws_user.arn
}

output "unique_id" {
  description = "The unique ID assigned by AWS"
  value       = aws_iam_user.aws_user.unique_id
}
output "username" {
  description = "The IAM user's name"
  value       = aws_iam_user_login_profile.user_login.user
}

output "password" {
  description = "The encrypted password, base64 encoded. Only available if password was handled on Terraform resource creation, not import"
  value       = aws_iam_user_login_profile.user_login.encrypted_password
}

