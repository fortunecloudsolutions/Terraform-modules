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

variable "cidr_subnet" {
  description = "The CIDR block for the subnet."
  type        = string
}

variable "availability_zone" {
  description = " The AZ for the subnet."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "map_publicip" {
  description = " Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
  type        = bool
}

variable "tags" {
  description = "Map of tag key and value pairs"
  type        = map(any)
  default     = {}
}