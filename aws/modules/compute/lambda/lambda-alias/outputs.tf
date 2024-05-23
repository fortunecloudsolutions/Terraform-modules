output "arn" {
  description = "Amazon Resource Name (ARN) of Lambda Alias"
  value       = aws_lambda_alias.lambda_alias.arn
}

output "name" {
  description = "Name of Lambda Alias"
  value       = aws_lambda_alias.lambda_alias.name
}

output "invoke_arn" {
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = aws_lambda_alias.lambda_alias.invoke_arn
}
