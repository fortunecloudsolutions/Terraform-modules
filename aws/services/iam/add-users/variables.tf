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