resource "aws_iam_group_policy" "default_policy" {
  name   = var.name
  group  = var.group
  policy = var.iam_policy

}