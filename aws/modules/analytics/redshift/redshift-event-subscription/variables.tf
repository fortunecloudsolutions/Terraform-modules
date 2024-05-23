variable "name" {
  type        = string
  description = "(Required) The name of the Redshift event subscription."
}

variable "sns_topic_arn" {
  type        = string
  description = "(Required) The ARN of the SNS topic to send events to."
}

variable "source_ids" {
  type        = list(string)
  description = "(Optional) A list of identifiers of the event sources for which events will be returned. If not specified, then all sources are included in the response. If specified, a source_type must also be specified."
  default     = []
}

variable "source_type" {
  type        = string
  description = "(Optional) The type of source that will be generating the events. Valid options are cluster, cluster-parameter-group, cluster-security-group, or cluster-snapshot. If not set, all sources will be subscribed to."
  default     = null
}

variable "severity" {
  type        = string
  description = "(Optional) The event severity to be published by the notification subscription. Valid options are INFO or ERROR."
  default     = null
}

variable "event_categories" {
  type        = list(string)
  description = "(Optional) A list of event categories for a SourceType that you want to subscribe to. See https://docs.aws.amazon.com/redshift/latest/mgmt/working-with-event-notifications.html or run aws redshift describe-event-categories."
  default     = []
}

variable "enabled" {
  type        = bool
  description = "(Optional) A boolean flag to enable/disable the subscription. Defaults to true."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

