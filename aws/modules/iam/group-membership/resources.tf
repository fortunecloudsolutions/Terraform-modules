resource "aws_iam_group_membership" "team" {
  name = var.name

  users = var.user

  group = var.group
}
