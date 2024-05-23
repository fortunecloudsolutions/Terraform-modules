
resource "aws_iam_signing_certificate" "test_cert" {
  user_name         = var.user_name
  certificate_body = var.certificate_body
}