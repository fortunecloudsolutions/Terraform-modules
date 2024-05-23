output "arn" {
  description = "Amazon Resource Name (ARN) of the configuration."
  value       = aws_msk_configuration.config.arn
}
output "latest_revision" {
  description = " Latest revision of the configuration."
  value       = aws_msk_configuration.config.latest_revision
}