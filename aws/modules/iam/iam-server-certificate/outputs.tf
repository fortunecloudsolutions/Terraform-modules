output "arn" {
  description = " Indicates whether passwords in the account expire. Returns true if max_password_age contains a value greater than 0. Returns false if it is 0 or not present."
  value       = aws_iam_server_certificate.test_cert.arn
}

output "id" {
  description = " Indicates whether passwords in the account expire. Returns true if max_password_age contains a value greater than 0. Returns false if it is 0 or not present."
  value       = aws_iam_server_certificate.test_cert.id
}

output "name" {
  description = " Indicates whether passwords in the account expire. Returns true if max_password_age contains a value greater than 0. Returns false if it is 0 or not present."
  value       = aws_iam_server_certificate.test_cert.name
}





