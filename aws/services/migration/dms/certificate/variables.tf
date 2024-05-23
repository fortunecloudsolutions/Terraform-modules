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

variable "certificate_id" {
  description = "(Required) The certificate identifier. Must contain from 1 to 255 alphanumeric characters and hyphens."
  type        = string
}

variable "certificate_pem" {
  description = "(Optional) The contents of the .pem X.509 certificate file for the certificate. Either certificate_pem or certificate_wallet must be set."
  type        = string
  default     = null
}

variable "certificate_wallet" {
  description = "(Optional) The contents of the Oracle Wallet certificate for use with SSL. Either certificate_pem or certificate_wallet must be set."
  type        = string
  default     = null
}