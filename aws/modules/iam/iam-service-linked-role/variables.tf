
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

