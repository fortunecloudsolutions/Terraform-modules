variable "name" {
  description = "The name of the DB parameter group. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}
variable "family" {
  description = "The family of the DB parameter group."
  type        = string
}

variable "parameters" {
  description = " A list of DB parameters to apply. Note that parameters may differ from a family to an other."
  type        = list(map(string))
  default     = []
}
variable "description" {
  description = "The description of the DB parameter group. "
  type        = string
  default     = "Managed by Terraform"
}
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}