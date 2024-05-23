variable "repository" {
  type        = string
  description = "(Required) Name of the repository to apply the policy."
}
variable "policy" {
  type        = string
  description = "(Required) The policy document. This is a JSON formatted string."
}