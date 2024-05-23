variable "policy_document" {
  type        = string
  description = "(Required) Details of the resource policy, including the identity of the principal that is enabled to put logs to this account. This is formatted as a JSON string. Maximum length of 5120 characters."
}

variable "policy_name" {
  type        = string
  description = "(Required) Name of the resource policy."
}