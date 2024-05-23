variable "name" {
  type        = string
  description = "(Optional, Forces new resource) The name of the neptune subnet group. If omitted, Terraform will assign a random, unique name."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) The description of the neptune subnet group. Defaults to Managed by Terraform."
  default     = "Managed by Terraform"
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) A list of VPC subnet IDs."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}
