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
variable "virtual_mfa_device_name" {
  description = "(Required) The name of the virtual MFA device. Use with path to uniquely identify a virtual MFA device."
  type        = string

}
variable "path" {
  description = "(Optional) The path for the virtual MFA device."
  type        = string
  default     = null

}