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

variable "asg_group_names" {
  type        = list(string)
  description = "A list of AutoScaling Group Names"
}

variable "notification_types" {
  type        = list(string)
  description = "A list of Notification Types that trigger notifications."
}

variable "topic_arn" {
  type        = string
  description = "The Topic ARN for notifications to be sent through"
}