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