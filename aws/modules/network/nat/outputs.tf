output "nat_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}
output "nat_allocation_id" {
  description = "The Allocation ID of the Elastic IP address for the gateway"
  value       = aws_nat_gateway.nat_gateway.allocation_id
}
output "nat_network_interface_id" {
  description = "The ENI ID of the network interface created by the NAT gateway"
  value       = aws_nat_gateway.nat_gateway.network_interface_id
}
output "nat_private_ip" {
  description = "The private IP address of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.private_ip
}
output "nat_public_ip" {
  description = "The public IP address of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.public_ip
}