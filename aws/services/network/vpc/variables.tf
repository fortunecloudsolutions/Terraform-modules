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

variable "cidr_vpc" {
  description = "The CIDR block for the VPC."
  type        = string

}
variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  type        = bool
}
variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  type        = bool
}
variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host."
  type        = string
}
variable "tags" {
  description = "A map of tags to assign to the resource vpc."
  type        = map(any)
  default     = {}
}
