variable "name" {
  description = "The name of the DB subnet group. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null

}
variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

variable "description" {
  description = "The description of the DB subnet group."
  type        = string
  default     = "Managed by Terraform"
}
variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
}
