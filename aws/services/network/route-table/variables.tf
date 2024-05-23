variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  description = "The Vault URL to which vault sends and requests data"
  type        = string
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
  description = "(Required) The VPC ID."
  type        = string

}

variable "propagating_vgws" {
  description = "(Optional) A list of virtual gateways for propagation."
  type        = list(any)
  default  = null

}

variable "route" {
  description = "(Optional) A list of route objects."
  type = object({
    cidr_block = string #  (Required) The CIDR block of the route.
    gateway_id = string # (Optional) Identifier of a VPC internet gateway or a virtual private gateway.
  })

}

variable "carrier_gateway_id" {
  description = "(Optional) Identifier of a carrier gateway."
  type        = string
  default  = null

}
variable "core_network_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of a core network."
  type        = string
  default  = null

}
variable "egress_only_gateway_id" {
  description = "(Optional) Identifier of a VPC Egress Only Internet Gateway."
  type        = string
  default  = null

}



