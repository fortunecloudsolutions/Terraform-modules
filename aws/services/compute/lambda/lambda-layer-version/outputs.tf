output "arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:layer:testlayer:1"}
  description = "The Amazon Resource Name (ARN) of the Lambda Layer with version."
  value       = module.lambda_layer.arn
}

output "layer_arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:layer:testlayer"}
  description = "The Amazon Resource Name (ARN) of the Lambda Layer without version."
  value       = module.lambda_layer.layer_arn
}

output "created_date" {
  #{"type":"string","default":"2021-09-14T21:46:06.211+0000"}
  description = "The date this resource was created."
  value       = module.lambda_layer.created_date
}

output "signing_job_arn" {
  #{"type":"string","default":"dummy"}
  description = "The Amazon Resource Name (ARN) of a signing job."
  value       = module.lambda_layer.signing_job_arn
}

output "signing_profile_version_arn" {
  #{"type":"string","default":"dummy"}
  description = "The Amazon Resource Name (ARN) for a signing profile version."
  value       = module.lambda_layer.signing_profile_version_arn
}

output "source_code_size" {
  #{"type":"number","default":"262"}
  description = "The size in bytes of the function .zip file."
  value       = module.lambda_layer.source_code_size
}

output "version" {
  #{"type":"string","default":"1"}
  description = "This Lamba Layer version."
  value       = module.lambda_layer.version
}