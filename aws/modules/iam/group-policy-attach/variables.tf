variable "policy_arn" {
  description = " The ARN of the policy you want to apply"
  type        = string
  default     = ""
}
variable "group" {
  description = "The group the policy should be applied to"
  type        = string
  default     = "mygroup"
}

