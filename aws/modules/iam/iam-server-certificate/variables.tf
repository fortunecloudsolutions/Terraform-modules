
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