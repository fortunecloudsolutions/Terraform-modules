variable "policy" {
  type        = string
  description = "(Required) The text of the policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
}

variable "event_bus_name" {
  type        = string
  description = "(Optional) The event bus to set the permissions on. If you omit this, the permissions are set on the default event bus."
  default     = null
}

