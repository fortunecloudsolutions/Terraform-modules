output "kms_key_id" {
  description = "The Amazon Resource Name (ARN) of the key."
  value       = aws_kms_key.kms_key.arn
}