output "id" {
  description = "The ID of the VPC Endpoint Connection."
  value       = aws_vpc_endpoint_connection_accepter.example.id
}

output "vpc_endpoint_state" {
  description = "State of the VPC Endpoint."
  value       = aws_vpc_endpoint_connection_accepter.example.vpc_endpoint_state
}
