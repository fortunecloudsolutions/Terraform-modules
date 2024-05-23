output "arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:function:test-lambda-function"}
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
  value       = module.lambda_function.arn
}

output "invoke_arn" {
  #{"type":"string","default":"arn:aws:apigateway:us-east-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-2:046692759124:function:test-lambda-function/invocations"}
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = module.lambda_function.invoke_arn
}

output "last_modified" {
  #{"type":"string","default":"2021-09-14T21:01:11.646+0000"}
  description = "Date this resource was last modified."
  value       = module.lambda_function.last_modified
}

output "qualified_arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:function:test-lambda-function:$LATEST"}
  description = "ARN identifying your Lambda Function Version (if versioning is enabled via publish = true)."
  value       = module.lambda_function.qualified_arn
}

output "signing_job_arn" {
  #{"type":"string","default":"dummy"}
  description = "ARN of the signing job."
  value       = module.lambda_function.signing_job_arn
}

output "signing_profile_version_arn" {
  #{"type":"string","default":"dummy"}
  description = "ARN of the signing profile version."
  value       = module.lambda_function.signing_profile_version_arn
}

output "source_code_size" {
  #{"type":"number","default":"262"}
  description = "Size in bytes of the function .zip file."
  value       = module.lambda_function.source_code_size
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.lambda_function.tags_all
}

output "version" {
  #{"type":"string","default":"$LATEST"}
  description = "Latest published version of your Lambda Function."
  value       = module.lambda_function.version
}

output "function_name" {
  #{"type":"string","default":"Print"}
  description = "The lambda function name"
  value       = module.lambda_function.function_name
}

# output "vpc_id" {
#   description = "ID of the VPC."
#   value       = module.lambda_function.vpc_config.vpc_id
# }

