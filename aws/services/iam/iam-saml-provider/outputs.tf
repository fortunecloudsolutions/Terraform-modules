
output "arn" {
  #{"type":"string","default":"dummy"}
  description = "Access key ID."
  value       = module.aws_iam_saml_provider.arn
}

output "valid_until" {
  #{"type":"string","default":"dummy"}
  description = "Access key ID."
  value       = module.aws_iam_saml_provider.valid_until
}