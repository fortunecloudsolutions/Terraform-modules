variable "name" {
  description = "The name of the attachment. This cannot be an empty string."
  type        = string
}
variable "policy_arn" {
  description = "The ARN of the policy you want to apply"
  type        = string
}
variable "user_list" {
  description = "The user(s) the policy should be applied to"
  type        = list(any)
}
variable "roles_list" {
  description = "The role(s) the policy should be applied to"
  type        = list(any)
}
variable "group_list" {
  description = "The group(s) the policy should be applied to"
  type        = list(any)
}


