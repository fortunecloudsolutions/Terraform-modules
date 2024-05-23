resource "aws_cloudwatch_log_destination" "cloudwatch_log_destination" {
  name       = var.name
  role_arn   = var.role_arn
  target_arn = var.target_arn
}