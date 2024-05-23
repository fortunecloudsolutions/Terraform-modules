output "ssh_public_key_id" {
  description = "The unique identifier for the SSH public key."
  value       = aws_iam_user_ssh_key.user.ssh_public_key_id
}

output "fingerprint" {
  description = "The MD5 message digest of the SSH public key."
  value       = aws_iam_user_ssh_key.user.fingerprint
}

