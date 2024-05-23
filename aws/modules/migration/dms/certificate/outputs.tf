output "certificate_arn" {
  #{"type":"string","default":"arn:dummy"}
  description = "The Amazon Resource Name (ARN) for the certificate."
  value       = aws_dms_certificate.certificate.certificate_arn
}