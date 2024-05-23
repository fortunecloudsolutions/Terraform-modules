output "public_key_openssh" {
  description = "The public key data in open SSH format"
  value       = tls_private_key.private_key.public_key_openssh
}

output "private_key_pem" {
  description = "The private key data in pem format"
  value       = tls_private_key.private_key.private_key_pem
}

output "private_key_pem_base64encoded" {
  description = "The private key data in pem format base64 encoded"
  value       = base64encode(tls_private_key.private_key.private_key_pem)
}