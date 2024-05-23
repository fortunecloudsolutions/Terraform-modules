output "eni_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the network interface"
  value       = module.eni.eni_id
}
