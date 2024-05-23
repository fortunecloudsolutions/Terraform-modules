variable "user_name" {
  description = "The name of the IAM User to add to groups"
  type        = string
}
variable "group_list" {
  description = "A list of IAM Groups to add the user to"
  type        = list(any)
  default     = []
}

