output "eni_id" {
  description = "The ID of the network interface"
  value       = aws_network_interface.multi-ip.id
}
