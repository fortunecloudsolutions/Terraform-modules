variable "name" {
  type        = string
  description = "(Required) The name of the new event bus. The names of custom event buses can't contain the / character."
}

variable "event_source_name" {
  type        = string
  description = "(Optional) The partner event source that the new event bus will be matched with. Must match name."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}