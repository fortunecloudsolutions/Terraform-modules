variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  type        = string
  description = "The Vault URL to which vault sends and requests data"
}

variable "vault_token" {
  description = "The vault token, used for authorization"
  type        = string
}

variable "max_lease_seconds" {
  description = "Specifies the maximum time-to-live. If set, this overrides the global default. Must be a valid duration string"
  type        = string
}

variable "backend" {
  description = "Backend is the provider"
  type        = string
}

variable "role" {
  description = "Role is usually resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "route" {
  description = "A list of route objects."
  type = list(object({
    cidr_block                = string # The CIDR block of the route.
    egress_only_gateway_id    = string # Identifier of a VPC Egress Only Internet Gateway.
    gateway_id                = string # Identifier of a VPC internet gateway or a virtual private gateway.
    instance_id               = string # Identifier of an EC2 instance.
    nat_gateway_id            = string #  Identifier of a VPC NAT gateway.
    local_gateway_id          = string # Identifier of a Outpost local gateway.
    network_interface_id      = string # Identifier of an EC2 network interface. 
    transit_gateway_id        = string # Identifier of an EC2 Transit Gateway. 
    vpc_peering_connection_id = string # Identifier of a VPC peering connection.
  }))
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "propagating_vgws" {
  description = "A list of virtual gateways for propagation."
  type        = list(any)
  default     = []
}