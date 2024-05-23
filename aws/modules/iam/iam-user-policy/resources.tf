resource "aws_iam_user_policy" "lb_ro" {
  name   = var.name
  user   = var.user
  policy = var.iam_policy

}