output "arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:function:test-lambda-function:testfunc1"}
  description = "Amazon Resource Name (ARN) of Lambda Alias"
  value       = module.lambda_alias.arn
}
output "name" {
  #{"type":"string","default":"testfunc1"}
  description = "Name of Lambda alias"
  value       = module.lambda_alias.name
}
output "invoke_arn" {
  #{"type":"string","default":"arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:046692759124:function:test-lambda-function:testfunc1/invocations"}
  description = "The ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri"
  value       = module.lambda_alias.invoke_arn
}
