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


