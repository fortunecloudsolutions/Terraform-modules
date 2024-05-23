output "arn" {
  #{"type":"string","default":"arn:aws:secretsmanager:us-east-2:987654321098:secret:terraform-20210120201329291400000001-nk4JOQ"}
  description = "The ARN of the secret."
  value       = module.secrets_manager.arn
}
output "id" {
  #{"type":"string","default":"arn:aws:secretsmanager:us-east-2:987654321098:secret:terraform-20210120201329291400000001-nk4JOQ"}
  description = " Amazon Resource Name (ARN) of the secret."
  value       = module.secrets_manager.id
}
output "rotation_enabled" {
  #{"type":"string","default":"true"}
  description = " Specifies whether automatic rotation is enabled for this secret."
  value       = module.secrets_manager.rotation_enabled
}
