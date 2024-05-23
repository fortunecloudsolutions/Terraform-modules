variable "identifier" {
  type        = string
  description = "(Optional, Forces new resource) The snapshot schedule identifier. If omitted, Terraform will assign a random, unique identifier."
  default     = null
}

variable "identifier_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique identifier beginning with the specified prefix. Conflicts with identifier."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) The description of the snapshot schedule."
  default     = null
}

variable "definitions" {
  type        = list(string)
  description = "(Optional) The definition of the snapshot schedule. The definition is made up of schedule expressions, for example cron(30 12 *) or rate(12 hours)."
  default     = []
}

variable "force_destroy" {
  type        = string
  description = "(Optional) Whether to destroy all associated clusters with this snapshot schedule on deletion. Must be enabled and applied before attempting deletion."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}
