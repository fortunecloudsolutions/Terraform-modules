output "registry_id" {
  #{"type":"string","default":"046692759124"}
  description = " The registry ID where the repository was created."
  value       = module.replication_configuration.registry_id
}