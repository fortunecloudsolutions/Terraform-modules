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
variable "name" {
  description = "The name of the role. If omitted, Terraform will assign a random, unique name."
  type        = string
}
variable "role_policy" {
  description = "(Required) The policy that grants an entity permission to assume the role."
  type        = string
}
variable "tags" {
  description = "Key-value map of tags for the IAM role"
  type        = map(any)
  default     = {}
}