variable "domain_name" {
  type        = string
  description = "(Required) Name of the domain."
}

variable "access_policies" {
  type        = string
  description = "(Optional) IAM policy document specifying the access policies for the domain"
}
