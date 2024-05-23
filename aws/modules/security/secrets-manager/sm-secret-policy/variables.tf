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
