variable "replication_subnet_group_description" {
  description = "(Required) The description for the subnet group."
  type        = string
}

variable "replication_subnet_group_id" {
  description = "(Required) The name for the replication subnet group. This value is stored as a lowercase string. Must contain no more than 255 alphanumeric characters, periods, spaces, underscores, or hyphens. Must not be 'default'"
  type        = string
}

variable "subnet_ids" {
  description = "(Required) A list of the EC2 subnet IDs for the subnet group."
  type        = list(string)
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
