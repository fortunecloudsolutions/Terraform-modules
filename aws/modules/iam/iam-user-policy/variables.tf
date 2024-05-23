


variable "name" {
  description = "(Optional) The name of the policy. If omitted, Terraform will assign a random, unique name."
  type        = string

}


variable "user" {
  description = "(Required) IAM user to which to attach this policy."
  type        = string

}

variable "iam_policy" {
  description = "(Required) The policy document. This is a JSON formatted string. "
  type        = string
}


