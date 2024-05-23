
output "id" {
    #{"type":"string","default":"dummy"}
  description = "The ID of the VPC Endpoint Connection."
  value       = module.aws_vpc_endpoint_connection_accepter.id
}

output "vpc_endpoint_state" {
    #{"type":"string","default":"dummy"}
  description = "State of the VPC Endpoint."
  value       = module.aws_vpc_endpoint_connection_accepter.vpc_endpoint_state
}
