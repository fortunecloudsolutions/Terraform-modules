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

variable "db_instance_identifier" {
  description = "The DB Instance Identifier from which to take the snapshot."
  type        = list(any)
}
variable "db_snapshot_identifier" {
  description = "The Identifier for the snapshot."
  type        = string
}
variable "tags" {
  description = "Key-value map of resource tags"
  type        = map(string)
  default     = {}
}