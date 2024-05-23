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

variable "stream_arn" {
  type        = string
  description = "(Required) The ARN for a Kinesis data stream. This must exist in the same account and region as the DynamoDB table."
}

variable "table_name" {
  type        = string
  description = "(Required) The name of the DynamoDB table. There can only be one Kinesis streaming destination for a given DynamoDB table."
}