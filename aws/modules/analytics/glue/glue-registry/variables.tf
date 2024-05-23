variable "registry_name" {
  type        = string
  description = "(Required) The Name of the registry."
}

variable "description" {
  type        = string
  description = "(Optional) A description of the registry."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}
