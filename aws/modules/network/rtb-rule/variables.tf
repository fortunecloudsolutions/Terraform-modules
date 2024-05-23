
variable "route_table_id" {
  description = "The ID of the routing table."
  type        = string
}

variable "route" {
  description = "A list of route objects."
  type = object({
    cidr_block                = string # The CIDR block of the route.
    egress_only_gateway_id    = string # Identifier of a VPC Egress Only Internet Gateway.
    gateway_id                = string # Identifier of a VPC internet gateway or a virtual private gateway.
    instance_id               = string # Identifier of an EC2 instance.
    nat_gateway_id            = string #  Identifier of a VPC NAT gateway.
    local_gateway_id          = string # Identifier of a Outpost local gateway.
    network_interface_id      = string # Identifier of an EC2 network interface. 
    transit_gateway_id        = string # Identifier of an EC2 Transit Gateway. 
    vpc_peering_connection_id = string # Identifier of a VPC peering connection.
  })
}
