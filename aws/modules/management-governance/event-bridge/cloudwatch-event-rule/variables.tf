variable "name" {
  type        = string
  description = "(Optional) The name of the rule. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(Optional) The name of the rule. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
  default     = null
}

variable "schedule_expression" {
  type        = string
  description = "(Optional) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes). At least one of schedule_expression or event_pattern is required. Can only be used on the default event bus."
  default     = null
}

variable "event_bus_name" {
  type        = string
  description = "(Optional) The event bus to associate with this rule. If you omit this, the default event bus is used."
  default     = null
}

variable "event_pattern" {
  type        = string
  description = "(Optional) The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) The description of the rule."
  default     = null
}

variable "role_arn" {
  type        = string
  description = "(Optional) The Amazon Resource Name (ARN) associated with the role that is used for target invocation."
  default     = null
}

variable "is_enabled" {
  type        = bool
  description = "(Optional) Whether the rule should be enabled (defaults to true)."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}