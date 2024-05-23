output "id" {
  #{"type":"string","default":"dummy"}
  description = "  The certificate_id:user_name"
  value       = module.aws_iam_signing_certificate.id
}

output "certificate_id" {
  #{"type":"string","default":"dummy"}
  description = " The ID for the signing certificate."
  value       = module.aws_iam_signing_certificate.certificate_id
}






