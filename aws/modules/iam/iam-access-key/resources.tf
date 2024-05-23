resource "aws_iam_access_key" "test" {
  user    = var.user
  pgp_key = var.pgp_key
}

