output "id" {
  #{"type":"string","default":"test-lambda-function:testfunc1"}
  description = "Lambda Function name and qualifier separated by a colon (:)."
  value       = module.lambda_provisioned_concurrency_config.id
}

