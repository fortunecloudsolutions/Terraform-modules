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


variable "replication_configuration" {
  type = object({
    rule = object({
      destination = list(object({
        region      = string #(Required) A Region to replicate to.
        registry_id = string #(Required) The account ID of the destination registry to replicate to.

      }))
    })
  })
  description = "(Required) Replication configuration for a registry."
}

