variable "algorithm" {
  description = "The name of the algorithm to use for the key. Currently-supported values are RSA and ECDSA. "
  type        = string

}

variable "rsa_bits" {
  description = " When algorithm is RSA, the size of the generated RSA key in bits. Defaults to 2048."
  type        = number
}

variable "edsa_curve" {
  description = "When algorithm is ECDSA, the name of the elliptic curve to use. "
  type        = string
  default     = null
}