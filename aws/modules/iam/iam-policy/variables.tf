variable "name" {
  description = "The name of the policy. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}
variable "path" {
  description = " Path in which to create the policy. See IAM Identifiers for more information."
  type        = string
}
variable "desc" {
  description = "Description of the IAM policy."
  type        = string
  default     = null
}
variable "iam_policy" {
  description = "The policy document. This is a JSON formatted string. "
  type        = string
}
