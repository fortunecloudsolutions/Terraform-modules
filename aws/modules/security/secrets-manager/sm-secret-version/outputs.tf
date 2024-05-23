output "arn" {
  description = "The ARN of the secret."
  value       = aws_secretsmanager_secret_version.secret_version.arn
}
output "id" {
  description = " A pipe delimited combination of secret ID and version ID."
  value       = aws_secretsmanager_secret_version.secret_version.id
}
output "version_id" {
  description = " The unique identifier of the version of the secret."
  value       = aws_secretsmanager_secret_version.secret_version.version_id
}
