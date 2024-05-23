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
  description = "(Required) The name of the IAM user to associate the SSH public key with."
  type        = string

}
variable "encoding" {
  description = "(Required) Specifies the public key encoding format to use in the response."
  type        = string

}

variable "public_key" {
  description = "(Required) The SSH public key. The public key must be encoded in ssh-rsa format or PEM format."
  type        = string

}
variable "status" {
  description = "(Optional) The status to assign to the SSH public key."
  type        = string
  default     = null

}


