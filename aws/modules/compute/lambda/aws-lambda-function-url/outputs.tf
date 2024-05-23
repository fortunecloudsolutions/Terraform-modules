output "function_arn" {
  description = "The Amazon Resource Name (ARN) of the function."
  value       = aws_lambda_function_url.test_latest.function_arn
}

output "function_url" {
  description = "The HTTP URL endpoint for the function in the format."
  value       = aws_lambda_function_url.test_latest.function_url
}

output "url_id" {
  description = "A generated ID for the endpoint."
  value       = aws_lambda_function_url.test_latest.url_id
}
