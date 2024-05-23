output "id" {
  description = "Fully qualified Lambda Function name or Amazon Resource Name (ARN)"
  value       = aws_lambda_function_event_invoke_config.lambda_event_invoke_config.id
}

