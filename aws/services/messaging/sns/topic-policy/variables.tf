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

variable "topic_arn" {
  type        = string
  description = "(Required) The ARN of the SNS topic."
}

variable "topic_policy" {
  type        = string
  description = "(Required)The fully-formed AWS policy as JSON. This policy defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic."
}
