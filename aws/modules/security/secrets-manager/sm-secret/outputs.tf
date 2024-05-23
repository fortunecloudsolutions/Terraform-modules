output "arn" {
  description = "The ARN of the secret."
  value       = aws_secretsmanager_secret.secret_manager.arn
}
output "id" {
  description = " Amazon Resource Name (ARN) of the secret."
  value       = aws_secretsmanager_secret.secret_manager.id
}
output "rotation_enabled" {
  description = " Specifies whether automatic rotation is enabled for this secret."
  value       = aws_secretsmanager_secret.secret_manager.rotation_enabled
}
