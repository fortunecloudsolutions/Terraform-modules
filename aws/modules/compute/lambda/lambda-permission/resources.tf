resource "aws_lambda_permission" "lambda_permission" {
  statement_id        = var.statement_id
  action              = var.action
  function_name       = var.function_name
  principal           = var.principal
  source_arn          = var.source_arn
  qualifier           = var.qualifier
  event_source_token  = var.event_source_token
  source_account      = var.source_account
  statement_id_prefix = var.statement_id_prefix
}