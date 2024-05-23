resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = var.repository
  policy     = var.policy
}