variable "name" {
  type        = string
  description = "(Required) The name you assign to this workflow."
}

variable "default_run_properties" {
  type        = map(string)
  description = "(Optional) A map of default run properties for this workflow. These properties are passed to all jobs associated to the workflow."
  default     = {}
}

variable "description" {
  type        = string
  description = "(Optional) Description of the workflow."
  default     = null
}

variable "max_concurrent_runs" {
  type        = string
  description = "(Optional) Prevents exceeding the maximum number of concurrent runs of any of the component jobs. If you leave this parameter blank, there is no limit to the number of concurrent workflow runs."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}
