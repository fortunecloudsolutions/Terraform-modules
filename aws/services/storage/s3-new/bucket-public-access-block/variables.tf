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
  description = "(Required) S3 Bucket to which this Public Access Block configuration should be applied."
}

variable "block_public_acls" {
  type        = bool
  description = "(Optional) Whether Amazon S3 should block public ACLs for this bucket. Defaults to false. Enabling this setting does not affect existing policies or ACLs."
  default     = false
}

variable "block_public_policy" {
  type        = bool
  description = "(Optional) Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the existing bucket policy. "
  default     = false
}

variable "ignore_public_acls" {
  type        = string
  description = "(Optional) Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set."
  default     = false
}

variable "restrict_public_buckets" {
  type        = string
  description = "(Optional) Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the previously stored bucket policy, except that public and cross-account access within the public bucket policy, including non-public delegation to specific accounts, is blocked."
  default     = false
}