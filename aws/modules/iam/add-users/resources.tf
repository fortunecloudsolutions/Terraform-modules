resource "aws_iam_user" "aws_user" {
  name = var.username
  path = var.path
  #force_destroy = true
}

resource "aws_iam_user_login_profile" "user_login" {
  user                    = aws_iam_user.aws_user.name
  pgp_key                 = var.pgp_key
  password_length         = var.password_length
  password_reset_required = var.password_required
}