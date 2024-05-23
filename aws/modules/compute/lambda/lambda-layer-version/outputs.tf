output "arn" {
  description = "The Amazon Resource Name (ARN) of the Lambda Layer with version."
  value       = aws_lambda_layer_version.lambda_layer.arn
}

output "layer_arn" {
  description = "The Amazon Resource Name (ARN) of the Lambda Layer without version."
  value       = aws_lambda_layer_version.lambda_layer.layer_arn
}

output "created_date" {
  description = "The date this resource was created."
  value       = aws_lambda_layer_version.lambda_layer.created_date
}

output "signing_job_arn" {
  description = "The Amazon Resource Name (ARN) of a signing job."
  value       = aws_lambda_layer_version.lambda_layer.signing_job_arn
}

output "signing_profile_version_arn" {
  description = "The Amazon Resource Name (ARN) for a signing profile version."
  value       = aws_lambda_layer_version.lambda_layer.signing_profile_version_arn
}

output "source_code_size" {
  description = "The size in bytes of the function .zip file."
  value       = aws_lambda_layer_version.lambda_layer.source_code_size
}

output "version" {
  description = "This Lamba Layer version."
  value       = aws_lambda_layer_version.lambda_layer.version
}