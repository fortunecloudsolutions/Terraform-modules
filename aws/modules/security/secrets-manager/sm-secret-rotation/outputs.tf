output "arn" {
  description = "Amazon Resource Name (ARN) of the secret."
  value       = aws_secretsmanager_secret_rotation.secret_rotation.id
}
output "rotation_enabled" {
  description = "  Specifies whether automatic rotation is enabled for this secret."
  value       = aws_secretsmanager_secret_rotation.secret_rotation.rotation_enabled
}
