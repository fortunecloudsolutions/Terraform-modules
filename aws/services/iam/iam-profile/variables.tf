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
  description = "The profile's name. If omitted, Terraform will assign a random, unique name."
  type        = string

}
variable "role_name" {
  description = "The role name to include in the profile."
  type        = string

}
variable "path" {
  description = "Path in which to create the profile."
  type        = string

}