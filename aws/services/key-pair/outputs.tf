output "key_name" {
  #{"type":"string","default":"dummy"}
  description = "The key pair name."
  value       = module.key_pair.key_name
}

output "private_key_pem_base64encoded" {
  #{"type":"string","default":"ZHVtbXk="}
  description = "The private key data in pem format base64 encoded"
  value       = module.tls_private_key.private_key_pem_base64encoded
}
