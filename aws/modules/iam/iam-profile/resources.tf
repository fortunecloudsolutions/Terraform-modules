resource "aws_iam_instance_profile" "profile" {
  name = var.name
  path = var.path
  role = var.role
}