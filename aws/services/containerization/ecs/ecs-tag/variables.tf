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

variable "resource_arn" {
  description = "(Required) Amazon Resource Name (ARN) of the ECS resource to tag."
  type        = string
}
variable "key" {
  description = "(Required) Tag name."
  type        = string
}

variable "value" {
  description = "(Required) Tag value."
  type        = string
}