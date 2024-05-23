
output "ssh_public_key_id" {
  #{"type":"string","default":"dummy"}
  description = "The unique identifier for the SSH public key."
  value       = module.aws_iam_user_ssh_key.ssh_public_key_id
}

output "fingerprint" {
  #{"type":"string","default":"dummy"}
  description = "The MD5 message digest of the SSH public key."
  value       = module.aws_iam_user_ssh_key.fingerprint
}
