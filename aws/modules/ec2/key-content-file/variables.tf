variable "key_name" {
  description = "The name for the key pair."
  type        = string
  default     = null
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

variable "private_key_pem" {
  description = "The private key data in PEM format."
  type        = string
}