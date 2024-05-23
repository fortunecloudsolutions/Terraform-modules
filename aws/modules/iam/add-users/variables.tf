
variable "username" {
  description = "The user's name. The name must consist of upper and lowercase alphanumeric characters with no spaces."
  type        = string

}
variable "path" {
  description = "Path in which to create the user."
  type        = string

}
variable "password_length" {
  description = "The length of the generated password on resource creation. Only applies on resource creation."
  type        = number

}
variable "password_required" {
  description = " Whether the user should be forced to reset the generated password on resource creation. "
  type        = bool

}
variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username."
  type        = string

}