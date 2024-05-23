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
#key_pair
variable "create_key_pair" {
  description = "Controls if key pair should be created"
  type        = bool
  default     = true
}

variable "key_name" {
  description = "The name for the key pair."
  type        = string

}

variable "algorithm" {
  description = "The name of the algorithm to use for the key. Currently-supported values are RSA and ECDSA. "
  type        = string

}

variable "rsa_bits" {
  description = " When algorithm is RSA, the size of the generated RSA key in bits. Defaults to 2048."
  type        = number
}


variable "file_permission" {
  description = "The permission to set for any directories created. Expects a string."
  type        = string
  default     = null
}

variable "filepath" {
  description = "The local file path where to find private.pem key to login to ec2 instance"
  type        = string
  default     = "$HOME"
}