output "arn" {
  description = "The Amazon Resource Name (ARN) of the code signing configuration."
  value       = aws_lambda_code_signing_config.lambda_csc.arn
}

output "config_id" {
  description = "Unique identifier for the code signing configuration."
  value       = aws_lambda_code_signing_config.lambda_csc.config_id
}

output "last_modified" {
  description = "The date and time that the code signing configuration was last modified."
  value       = aws_lambda_code_signing_config.lambda_csc.last_modified
}

