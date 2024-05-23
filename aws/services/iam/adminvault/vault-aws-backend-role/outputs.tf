output "role" {
  #{"type":"string","default":"dummy"}
  description = "vault role"
  value       = module.vault_aws_secret_backend_role.role
}