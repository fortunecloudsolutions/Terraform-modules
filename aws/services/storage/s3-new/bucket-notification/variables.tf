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

variable "bucket" {
  type        = string
  description = "(Required) The name of the bucket to put notification configuration."
}


variable "topic" {
  type = list(object({

    id            = string       #(Optional) Specifies unique identifier for each of the notification configurations.
    topic_arn     = string       #(Required) Specifies Amazon SNS topic ARN.
    events        = list(string) #(Required) Specifies event for which to send notifications.
    filter_prefix = string       #(Optional) Specifies object key name prefix.
    filter_suffix = string       #(Optional) Specifies object key name suffix.

  }))
  description = "(Optional) The notification configuration to SNS Topic (documented below)."
  default     = null
}

variable "queue" {
  type = list(object({

    id            = string #(Optional) Specifies unique identifier for each of the notification configurations.
    queue_arn     = string #(Required) Specifies Amazon SQS queue ARN.
    events        = list(string) #(Required) Specifies event for which to send notifications.
    filter_prefix = string #(Optional) Specifies object key name prefix.
    filter_suffix = string #(Optional) Specifies object key name suffix.

  }))
  description = "(Optional) The notification configuration to SQS Queue (documented below)."
  default     = null
}

variable "lambda_function" {
  type = list(object({

    id                  = string #(Optional) Specifies unique identifier for each of the notification configurations.
    lambda_function_arn = string #(Required) Specifies Amazon Lambda function ARN.
    events              = list(string)#(Required) Specifies event for which to send notifications.
    filter_prefix       = string #(Optional) Specifies object key name prefix.
    filter_suffix       = string #(Optional) Specifies object key name suffix.

  }))
  description = "(Optional, Multiple) Used to configure notifications to a Lambda Function (documented below)."
  default     = null
}

