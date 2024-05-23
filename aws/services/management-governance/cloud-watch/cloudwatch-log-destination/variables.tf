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
  description = "(Required) A name for the log destination"
}

variable "role_arn" {
  type        = string
  description = "(Required) The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to put data into the target"
}

variable "target_arn" {
  type        = string
  description = "(Required) The ARN of the target Amazon Kinesis stream resource for the destination"
}
