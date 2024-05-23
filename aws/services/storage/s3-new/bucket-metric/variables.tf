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

variable "bucket" {
  type        = string
  description = "(Required) The name of the bucket to put metric configuration."
}

variable "name" {
  type        = string
  description = "(Required) Unique identifier of the metrics configuration for the bucket."
}

variable "filter" {
  type = object({
    prefix = string      #(Optional) Object prefix for filtering (singular).
    tags   = map(string) #(Optional) Object tags for filtering (up to 10).
  })
  description = "(Optional) Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags (documented below)."
  default     = null
}