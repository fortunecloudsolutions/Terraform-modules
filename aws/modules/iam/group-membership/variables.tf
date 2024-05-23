variable "name" {
  description = " The name to identify the Group Membership"
  type        = string
}
variable "group" {
  description = "path of the policy"
  type        = string
}
variable "user" {
  description = "A list of IAM User names to associate with the Group"
  type        = list(any)
}

