resource "aws_cloudwatch_log_resource_policy" "cloudwatch_log_resource_policy" {
  policy_document = var.policy_document
  policy_name     = var.policy_name
}