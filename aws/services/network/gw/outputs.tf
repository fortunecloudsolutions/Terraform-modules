output "gateway_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the Internet Gateway"
  value       = module.gw.gateway_id
}