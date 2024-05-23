resource "aws_iam_policy" "policy" {
  name        = var.name
  path        = var.path
  description = var.desc

  policy = var.iam_policy
}
