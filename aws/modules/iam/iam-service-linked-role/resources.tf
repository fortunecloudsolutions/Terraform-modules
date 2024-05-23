
resource "aws_iam_service_linked_role" "elasticbeanstalk" {
  aws_service_name = var.aws_service_name
}
