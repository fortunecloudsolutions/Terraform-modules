output "id" {
  #{"type":"string","default":"046692759124"}
  description = "The ID of the Data Catalog to set the security configuration for."
  value       = module.encryption_settings.id
}
