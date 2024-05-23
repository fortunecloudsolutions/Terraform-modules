output "id" {
  description = "  The certificate_id:user_name"
  value       = aws_iam_signing_certificate.test_cert.id
}

output "certificate_id" {
  description = " The ID for the signing certificate."
  value       = aws_iam_signing_certificate.test_cert.certificate_id
}





