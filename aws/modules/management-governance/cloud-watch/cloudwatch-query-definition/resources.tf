resource "aws_cloudwatch_query_definition" "cloudwatch_query_definition" {
  name            = var.name
  query_string    = var.query_string
  log_group_names = var.log_group_names

}
