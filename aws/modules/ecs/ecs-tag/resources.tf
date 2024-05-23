resource "aws_ecs_tag" "ecsTag" {
  resource_arn      = var.resource_arn
  key       = var.value
  value     = var.value

}