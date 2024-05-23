output "id" {
  #{"type":"string","default":"test-sec-configuration"}
  description = "Glue security configuration name"
  value       = module.security_configuration.id
}
