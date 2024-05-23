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


variable "aws_service_name" {
  description = "(Required) The contents of the public key certificate in PEM-encoded format."
  type        = string

}

variable "custom_suffix" {
  description = "(Required) The contents of the private key in PEM-encoded format."
  type        = string
  default     = null

}

variable "description" {
  description = "(Optional) Whether to require uppercase characters for user passwords."
  type        = string
  default     = null

}

