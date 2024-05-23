output "create_date" {
  #{"type":"string","default":"dummy"}
  description = "Date and time in RFC3339 format that the access key was created."
  value       = module.aws_iam_access_key.create_date
}

output "encrypted_secret" {
  #{"type":"string","default":"dummy"}
  description = "Encrypted secret, base64 encoded, if pgp_key was specified"
  value       = module.aws_iam_access_key.encrypted_secret
}
output "id" {
  #{"type":"string","default":"dummy"}
  description = "Access key ID"
  value       = module.aws_iam_access_key.id
}

output "secret" {
  #{"type":"string","default":"dummy"}
  description = "Secret access key. This attribute is not available for imported resource"
  value       = module.aws_iam_access_key.secret
  sensitive   = true
}

