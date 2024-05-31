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
variable "vpc_endpoint_type" {
  description = "(Optional) The VPC endpoint type, Gateway, GatewayLoadBalancer, or Interface. Defaults to Gateway."
  type        = string
  default     = "Gateway"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
}

