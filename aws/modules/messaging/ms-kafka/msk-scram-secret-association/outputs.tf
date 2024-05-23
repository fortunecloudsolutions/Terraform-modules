output "arn_id" {
  description = "Amazon Resource Name (ARN) of the MSK cluster."
  value       = aws_msk_scram_secret_association.msk_secret_association.id
}
