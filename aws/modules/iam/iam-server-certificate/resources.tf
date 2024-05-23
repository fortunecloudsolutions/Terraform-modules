
resource "aws_iam_server_certificate" "test_cert" {
  name             = var.name
  certificate_body = var.certificate_body
  private_key      = var.private_key
}