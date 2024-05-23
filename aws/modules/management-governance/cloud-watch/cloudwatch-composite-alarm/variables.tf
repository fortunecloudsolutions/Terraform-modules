variable "actions_enabled" {
  type        = bool
  description = "(Optional, Forces new resource) Indicates whether actions should be executed during any changes to the alarm state of the composite alarm. Defaults to true."
  default     = false
}

variable "alarm_actions" {
  type        = list(string)
  description = "(Optional) The set of actions to execute when this alarm transitions to the ALARM state from any other state. Each action is specified as an ARN. Up to 5 actions are allowed."
  default     = []
}

variable "alarm_description" {
  type        = string
  description = "(Optional) The description for the composite alarm."
  default     = null
}

variable "alarm_name" {
  type        = string
  description = "(Required) The name for the composite alarm. This name must be unique within the region."
}

variable "alarm_rule" {
  type        = string
  description = "(Required) An expression that specifies which other alarms are to be evaluated to determine this composite alarm's state. For syntax, see Creating a Composite Alarm. The maximum length is 10240 characters."
}

variable "insufficient_data_actions" {
  type        = list(string)
  description = "(Optional) The set of actions to execute when this alarm transitions to the INSUFFICIENT_DATA state from any other state. Each action is specified as an ARN. Up to 5 actions are allowed."
  default     = []
}

variable "ok_actions" {
  type        = list(string)
  description = "(Optional) The set of actions to execute when this alarm transitions to an OK state from any other state. Each action is specified as an ARN. Up to 5 actions are allowed."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to associate with the alarm. Up to 50 tags are allowed. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}