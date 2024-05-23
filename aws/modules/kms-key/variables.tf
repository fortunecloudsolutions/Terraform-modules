variable "description" {
  type        = string
  description = "The description of the KMS key"
}

variable "key_usage" {
  type        = string
  description = "(Optional) Specifies the intended use of the key. Valid values: ENCRYPT_DECRYPT or SIGN_VERIFY. Defaults to ENCRYPT_DECRYPT"
  default     = "ENCRYPT_DECRYPT"
}

variable "customer_master_key_spec" {
  type        = string
  description = "(Optional) Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports.  Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1. Defaults to SYMMETRIC_DEFAULT. "
  default     = "SYMMETRIC_DEFAULT"
}

variable "policy" {
  type        = string
  description = "(Optional) A valid policy JSON document, when null open to all users in the account who have IAM policy permissions"
  default     = null
}

variable "deletion_window_in_days" {
  type        = number
  description = " (Optional) Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  default     = 30
}

variable "is_enabled" {
  type        = bool
  description = "(Optional) Specifies whether the key is enabled."
  default     = true
}

variable "enable_key_rotation" {
  type        = bool
  description = "(Optional) Specifies whether key rotation is enabled"
  default     = false
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A map of tags to assign to the object."
  default     = {}
}