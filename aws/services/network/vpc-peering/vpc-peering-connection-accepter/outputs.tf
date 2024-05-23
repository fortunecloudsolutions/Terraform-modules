output "vpc_peering_id" {
  #{"type":"string","default":"pcx-02aab175985d8cf93"} 
  description = "The ID of the VPC Peering Connection."
  value       = module.vpc_peering_connection_accepter.id
}

output "accept_status" {
  #{"type":"string","default":"pending-acceptance"}
  description = "The status of the VPC Peering Connection request."
  value       = module.vpc_peering_connection_accepter.accept_status
}

