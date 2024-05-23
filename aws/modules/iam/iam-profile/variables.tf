variable "name" {
  description = "The profile's name. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}
variable "role" {
  description = "The role name to include in the profile."
  type        = string
}
variable "path" {
  description = "Path in which to create the profile."
  type        = string
}