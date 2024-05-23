output "id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the DHCP Options Set Association."
  value       = module.dhcp_associate.id
}

