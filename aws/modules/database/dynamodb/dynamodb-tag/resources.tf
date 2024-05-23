resource "aws_dynamodb_tag" "dynamodb_tag" {
  resource_arn = var.resource_arn
  key          = var.key
  value        = var.value
}
