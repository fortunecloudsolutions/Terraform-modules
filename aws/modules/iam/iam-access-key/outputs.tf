output "create_date" {
  description = "Date and time in RFC3339 format that the access key was created."
  value       = aws_iam_access_key.test.create_date
}

output "encrypted_secret" {
  description = "Encrypted secret, base64 encoded, if pgp_key was specified."
  value       = aws_iam_access_key.test.encrypted_secret
}

output "id" {
  description = "Access key ID."
  value       = aws_iam_access_key.test.id
}

output "secret" {
  description = "Secret access key. This attribute is not available for imported resources"
  value       = aws_iam_access_key.test.secret
}

