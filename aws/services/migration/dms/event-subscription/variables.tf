variable "region" {
  description = "aws region"
  type        = string
}

variable "vault_addr" {
  description = "vault address"
  type        = string
}

variable "vault_token" {
  description = "vault token"
  type        = string
}

variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}

variable "backend" {
  description = "The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}

variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}

variable "name" {
  description = "(Required) Name of event subscription."
  type        = string
}

variable "enabled" {
  description = "(Optional, Default: true) Whether the event subscription should be enabled."
  type        = bool
  default     = true
}

variable "event_categories" {
  description = "(Required) List of event categories to listen for, see DescribeEventCategories for a canonical list. EventCategories for SourceType: replication-instance: [low storage,configuration change,maintenance,deletion,creation,failover,failure]. EventCategories for SourceType: replication-task: [configuration change,state change,deletion,creation,failure]}"
  type        = list(string)
}

variable "source_type" {
  description = "(Required) Type of source for events. Valid values: replication-instance or replication-task"
  type        = string
}

variable "source_ids" {
  description = "(Required) Ids of sources to listen to."
  type        = list(string)
}

variable "sns_topic_arn" {
  description = "(Required) SNS topic arn to send events on."
  type        = string
}

variable "timeouts" {
  description = "aws_dms_event_subscription provides the following Timeouts configuration options:"
  type = object({
    create = string
    update = string
    delete = string
  })
}
