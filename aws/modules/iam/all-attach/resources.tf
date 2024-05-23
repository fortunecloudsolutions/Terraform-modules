resource "aws_iam_policy_attachment" "policy-attach" {
  name       = var.name
  users      = var.user_list
  roles      = var.roles_list
  groups     = var.group_list
  policy_arn = var.policy_arn
}
