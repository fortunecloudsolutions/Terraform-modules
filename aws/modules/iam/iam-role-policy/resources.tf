resource "aws_iam_role_policy" "test_policy" {
  role   = var.iam_role
  policy = var.iam_policy



}