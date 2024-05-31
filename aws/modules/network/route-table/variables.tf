variable "vpc_id" {
  description = "(Required) The VPC ID."
  type        = string
}

variable "propagating_vgws" {
  description = "(Optional) A list of virtual gateways for propagation."
  type        = list(any)
  default     = null
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
  default     = null
}

variable "core_network_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of a core network."
  type        = string
  default     = null
}

variable "egress_only_gateway_id" {
  description = "(Optional) Identifier of a VPC Egress Only Internet Gateway."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
}
