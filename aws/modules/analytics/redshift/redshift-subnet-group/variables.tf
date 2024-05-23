variable "name" {
  type        = string
  description = "(Required) The name of the Redshift Subnet group."
}


variable "description" {
  type        = string
  description = "(Optional) The description of the Redshift Subnet group. Defaults to Managed by Terraform."
  default     = null
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) An array of VPC subnet IDs."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}