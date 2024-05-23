
output "function_arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:function:test-lambda-function"}
  description = "The Amazon Resource Name (ARN) of the function."
  value       = module.aws_lambda_function_url.function_arn
}

output "function_url" {
  #{"type":"string","default":"dummy"}
  description = "The HTTP URL endpoint for the function in the format."
  value       = module.aws_lambda_function_url.function_url
}

output "url_id" {
  #{"type":"string","default":"dummy"}
  description = "A generated ID for the endpoint."
  value       = module.aws_lambda_function_url.url_id
}

























