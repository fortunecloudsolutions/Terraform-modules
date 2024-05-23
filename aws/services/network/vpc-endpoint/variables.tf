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

variable "service_name" {
  description = "(Required) A list of virtual gateways for propagation."
  type        = string

}


variable "auto_accept" {
  description = "(Optional) Accept the VPC endpoint (the VPC endpoint and service need to be in the same AWS account)."
  type        = string
  default     = null

}
variable "policy" {
  description = "(Optional) A policy to attach to the endpoint that controls access to the service."
  type        = string
  default     = null

}
variable "dns_options" {
  description = "(Optional) The DNS options for the endpoint. See dns_options below."
  type        = string
  default     = null

}
variable "ip_address_type" {
  description = "(Optional) The IP address type for the endpoint. Valid values are ipv4, dualstack, and ipv6."
  type        = string
  default     = null

}
variable "route_table_ids" {
  description = "(Optional) One or more route table IDs. Applicable for endpoints of type Gateway."
  type        = string
  default     = null

}

variable "vpc_endpoint_type" {
  description = "(Optional) The VPC endpoint type, Gateway, GatewayLoadBalancer, or Interface. Defaults to Gateway."
  type        = string
  default     = null

}
variable "security_group_ids" {
  description = "(Optional) The ID of one or more security groups to associate with the network interface. Applicable for endpoints of type Interface."
  type        = string
  default     = null

}


