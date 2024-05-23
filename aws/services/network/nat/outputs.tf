output "nat_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the NAT Gateway"
  value       = module.nat.nat_id
}
output "nat_allocation_id" {
  #{"type":"string","default":"dummy"}
  description = "The Allocation ID of the Elastic IP address for the gateway"
  value       = module.nat.nat_allocation_id
}
output "nat_network_interface_id" {
  #{"type":"string","default":"dummy"}
  description = "The ENI ID of the network interface created by the NAT gateway"
  value       = module.nat.nat_network_interface_id
}
output "nat_private_ip" {
  #{"type":"string","default":"dummy"}
  description = "The private IP address of the NAT Gateway"
  value       = module.nat.nat_private_ip
}
output "nat_public_ip" {
  #{"type":"string","default":"dummy"}
  description = "The public IP address of the NAT Gateway"
  value       = module.nat.nat_public_ip
}