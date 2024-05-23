resource "aws_ecr_registry_policy" "registry_policy" {
  policy = var.policy
}