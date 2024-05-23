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
variable "role_policy" {
  description = "(Required) The policy that grants an entity permission to assume the role."
  type        = string
}

variable "acl" {
  description = "(Optional) The canned ACL to apply. Defaults to 'private'."
  type        = string
}
variable "actions" {
  description = "s3 policy action"
  type        = list(string)
}


variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "(Optional, Default:false ) A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
  type        = bool
}

variable "sse_algorithm" {
  description = "Encryption algorithm"
  type        = string
}

variable "target_prefix" {
  description = "log prefix"
  type        = string
}

variable "website" {
  description = "Map containing static web-site hosting or redirect configuration."
  type        = map(string)
}

variable "cors_rule" {
  description = "List of maps containing rules for Cross-Origin Resource Sharing."
  type        = list(any)
}

variable "versioning" {
  description = "Map containing versioning configuration."
  type        = map(bool)
}


variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
}
variable "attach_policy" {
  description = "log prefix"
  type        = bool
}
variable "block_public_acls" {
  description = "log prefix"
  type        = bool
}
variable "block_public_policy" {
  description = "log prefix"
  type        = bool
}
variable "ignore_public_acls" {
  description = "log prefix"
  type        = bool
}
variable "restrict_public_buckets" {
  description = "log prefix"
  type        = bool
}

variable "bucket_name" {
  description = "The name of the bucket to which to apply the policy."
  type        = string
}