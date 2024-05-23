output "arn" {
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = aws_lambda_function.lambda_function.arn
}

output "invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = aws_lambda_function.lambda_function.invoke_arn
}

output "last_modified" {
  description = "Date this resource was last modified."
  value       = aws_lambda_function.lambda_function.last_modified
}

output "qualified_arn" {
  description = "ARN identifying your Lambda Function Version (if versioning is enabled via publish = true)."
  value       = aws_lambda_function.lambda_function.qualified_arn
}

output "signing_job_arn" {
  description = "ARN of the signing job."
  value       = aws_lambda_function.lambda_function.signing_job_arn
}

output "signing_profile_version_arn" {
  description = "ARN of the signing profile version."
  value       = aws_lambda_function.lambda_function.signing_profile_version_arn
}

output "source_code_size" {
  description = "Size in bytes of the function .zip file."
  value       = aws_lambda_function.lambda_function.source_code_size
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_lambda_function.lambda_function.tags_all
}

output "version" {
  description = "Latest published version of your Lambda Function."
  value       = aws_lambda_function.lambda_function.version
}

output "function_name" {
  #{"type":"string","default":"dummy"}
  description = "The lambda function name"
  value       = aws_lambda_function.lambda_function.function_name
}

# output "vpc_config.vpc_id" {
#   description = "ID of the VPC."
#   value       = aws_lambda_function.lambda_function.vpc_config.vpc_id
# }

