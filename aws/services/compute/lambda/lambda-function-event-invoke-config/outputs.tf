output "id" {
  #{"type":"string","default":"test-lambda-function"}
  description = "Fully qualified Lambda Function name or Amazon Resource Name (ARN)"
  value       = module.lambda_event_invoke_config.id
}

