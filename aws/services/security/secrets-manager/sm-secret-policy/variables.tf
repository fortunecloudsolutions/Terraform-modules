variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  description = "The Vault URL to which vault sends and requests data"
  type        = string
}
variable "vault_token" {
  description = "The vault token, used for authorization"
  type        = string
}

variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}

variable "backend" {
  description = "Backend is the provider"
  type        = string
}

variable "role" {
  description = "Role is usually resources"
  type        = string
}
variable "secret_arn" {
  type        = string
  description = "(Required) Secret ARN."
}

variable "policy" {
  type        = string
  description = " (Required) A valid JSON document representing a resource policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
}

variable "block_public_policy" {
  type        = string
  description = " (Optional) Makes an optional API call to Zelkova to validate the Resource Policy to prevent broad access to your secret."
  default     = null
}
