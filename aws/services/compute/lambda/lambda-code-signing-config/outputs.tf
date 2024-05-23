output "arn" {
  #{"type":"string","default":"arn:aws:lambda:us-east-2:046692759124:code-signing-config:csc-09e40952ed018521e"}
  description = "The Amazon Resource Name (ARN) of the code signing configuration."
  value       = module.lambda_csc.arn
}

output "config_id" {
  #{"type":"string","default":"csc-09e40952ed018521e"}
  description = "Unique identifier for the code signing configuration."
  value       = module.lambda_csc.config_id
}

output "last_modified" {
  #{"type":"string","default":"2021-09-14T21:15:19.205352Z"}
  description = "The date and time that the code signing configuration was last modified."
  value       = module.lambda_csc.last_modified
}

