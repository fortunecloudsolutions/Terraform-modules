output "arn" {
  description = "Access key ID."
  value       = aws_iam_saml_provider.default.id
}

output "valid_until" {
  description = "Access key ID."
  value       = aws_iam_saml_provider.default.valid_until
}


