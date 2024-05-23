
variable "certificate_body" {
  description = "(Required) The contents of the public key certificate in PEM-encoded format."
    type        = string

}

variable "status" {
  description = "(Optional) The status you want to assign to the certificate. "
  type        = string
  default     = null

}

variable "user_name" {
  description = "(Optional) Whether to require uppercase characters for user passwords."
  type        = string

}

