
resource "aws_iam_service_specific_credential" "test_cred" {
  service_name = var.service_name
  user_name    = var.user_name
}