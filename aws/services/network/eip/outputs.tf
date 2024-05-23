output "eip_id" {
  #{"type":"string","default":"dummy"}
  description = "Contains the EIP allocation ID"
  value       = module.standaloneeip.eip_id
}

output "elastic_public_ip" {
  #{"type":"string","default":"18.18.18.18"}
  description = "Contains the EIP allocation ID"
  value       = module.standaloneeip.elastic_public_ip
}

output "eip_association_id" {
  #{"type":"string","default":"dummy"}
  description = "Contains the EIP association ID"
  value       = module.eip_assoc.eip_assocation_id
}
