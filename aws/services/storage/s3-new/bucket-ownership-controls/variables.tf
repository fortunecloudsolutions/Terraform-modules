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
  description = "(Required) The name of the bucket that you want to associate this access point with."
}

variable "rule" {
  type = list(object({
    object_ownership = string #(Optional) Object ownership. Valid values: BucketOwnerPreferred or ObjectWriter
  }))
  description = "(Required) Configuration block(s) with Ownership Controls rules. Detailed below."
}