variable "create_key_pair" {
  description = "Controls if key pair should be created"
  type        = bool
  default     = true
}

variable "public_key" {
  description = "The public key data in OpenSSH authorized_keys format, if the selected private key format is compatible. All RSA keys are supported, and ECDSA keys with curves 'P256', 'P384' and 'P521' are supported. This attribute is empty if an incompatible ECDSA curve is selected."
  type        = string
}

variable "key_name" {
  description = "The name for the key pair."
  type        = string

}