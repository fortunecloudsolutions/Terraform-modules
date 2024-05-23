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


variable "certificate_body" {
  description = "(Required) The contents of the public key certificate in PEM-encoded format."
  type        = string

}

variable "private_key" {
  description = "(Required) The contents of the private key in PEM-encoded format."
  type        = string

}

variable "name" {
  description = "(Optional) Whether to require uppercase characters for user passwords."
  type        = string
  default     = null

}

variable "name_prefix" {
  description = "(Optional) Whether to require numbers for user passwords."
  type        = string
  default     = null

}

variable "certificate_chain" {
  description = "(Optional) Whether to require lowercase characters for user passwords."
  type        = string
  default     = null

}

variable "path" {
  description = "(Optional) Minimum length to require for user passwords."
  type        = string
  default     = null

}

variable "tags" {
  description = "(Optional) The number of days that an user password is valid."
  type        = number
  default     = null

}