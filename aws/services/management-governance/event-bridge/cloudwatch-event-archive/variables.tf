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
  type        = string
  description = "(Required) The name of the new event archive. The archive name cannot exceed 48 characters."
}

variable "description" {
  type        = string
  description = "(Optional) The description of the new event archive."
  default     = null
}

variable "event_source_arn" {
  type        = string
  description = "(Required) Event bus source ARN from where these events should be archived."
}

variable "event_pattern" {
  type        = string
  description = "(Optional) Instructs the new event archive to only capture events matched by this pattern. By default, it attempts to archive every event received in the event_source_arn."
  default     = null
}

variable "retention_days" {
  type        = number
  description = "(Optional) The maximum number of days to retain events in the new event archive. By default, it archives indefinitely."
  default     = null
}

