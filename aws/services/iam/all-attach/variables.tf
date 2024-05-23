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
  description = "The name of the attachment. This cannot be an empty string."
  type        = string
}
variable "policy_arn" {
  description = "The ARN of the policy you want to apply"
  type        = string
}
variable "user_list" {
  description = "The user(s) the policy should be applied to"
  type        = list(any)
}
variable "roles_list" {
  description = "The role(s) the policy should be applied to"
  type        = list(any)
}
variable "group_list" {
  description = "The group(s) the policy should be applied to"
  type        = list(any)
}