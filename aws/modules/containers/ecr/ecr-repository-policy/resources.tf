resource "aws_ecr_repository_policy" "repository_policy" {
  repository = var.repository
  policy     = var.policy
}