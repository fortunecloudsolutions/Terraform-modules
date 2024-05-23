output "arn" {
  description = "The ARN of the certificate"
  value       = aws_acm_certificate.cert.arn
}


output "domain_name" {
  description = "The domain name for which the certificate is issued"
  value       = aws_acm_certificate.cert.domain_name
}


output "status" {
  description = "Status of the certificate."
  value       = aws_acm_certificate.cert.status
}


output "validation_emails" {
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
  value       = aws_acm_certificate.cert.validation_emails
}



