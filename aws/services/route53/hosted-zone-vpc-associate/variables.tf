variable "region" {
  description = "aws region"
  type        = string
}

variable "vault_addr" {
  description = "vault address"
  type        = string
}

variable "vault_token" {
  description = "vault token"
  type        = string
}

variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}

variable "backend" {
  description = "The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}

variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}

variable "zone_id" {
  type        = string
  description = "The private hosted zone to associate."
}

variable "vpc_id" {
  type        = string
  description = "The VPC to associate with the private hosted zone."
}

variable "vpc_region" {
  type        = string
  description = "The VPC's region. Defaults to the region of the AWS provider."
}