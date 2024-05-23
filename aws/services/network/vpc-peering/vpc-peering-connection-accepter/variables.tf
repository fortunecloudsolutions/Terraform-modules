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

variable "vpc_peering_connection_id" {
  description = "(Required) The ID of the requester VPC peering connection."
  type        = string
}

variable "auto_accept" {
  description = "(Optional) Accept the peering (both VPCs need to be in the same AWS account)."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}