resource "aws_lambda_provisioned_concurrency_config" "lambda_provisioned_concurrency_config" {
  function_name                     = var.function_name
  provisioned_concurrent_executions = var.provisioned_concurrent_executions
  qualifier                         = var.qualifier
  timeouts {
    create = lookup(var.timeouts, "create", "15m")
    update = lookup(var.timeouts, "update", "15m")

  }
}