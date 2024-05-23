resource "aws_iam_user_group_membership" "add_groups" {
  user = var.user_name

  groups = var.group_list
}
