output "id" {
  description = "Lambda Function name and qualifier separated by a colon (:)."
  value       = aws_lambda_provisioned_concurrency_config.lambda_provisioned_concurrency_config.id
}

