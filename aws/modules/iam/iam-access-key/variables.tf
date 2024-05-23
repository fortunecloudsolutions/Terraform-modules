
variable "user" {
  description = "The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces."
  type        = string

}

variable "status" {
  description = "Access key status to apply. Defaults to Active. Valid values are Active and Inactive."
  type        = bool
  default     = true

}
variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username."
  type        = string

}