variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  description = "The Vault URL to which vault sends and requests data"
  type        = string
}
variable "vault_token" {
  description = "The vault token, used for authorization"
  type        = string
}

variable "max_lease_seconds" {
  description = "Specifies the maximum time-to-live. If set, this overrides the global default. Must be a valid duration string"
  type        = string
}

variable "backend" {
  description = "Backend is the provider"
  type        = string
}
variable "role" {
  description = "Role is usually resources"
  type        = string
}


variable "traffic_type" {
  description = "(Required) The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL."
  type        = string

}

variable "eni_id" {
  description = "(Optional) Elastic Network Interface ID to attach to."
  type        = string
  default     = null

}

variable "iam_role_arn" {
  description = "(Optional) The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group."
  type        = string
  default     = null

}

variable "log_destination_type" {
  description = "(Optional) The type of the logging destination. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs."
  type        = string
  default     = null

}

variable "log_destination" {
  description = "(Optional) The ARN of the logging destination. Either log_destination or log_group_name must be set."
  type        = string
  default     = null

}

variable "log_group_name" {
  description = "(Optional) Deprecated: Use log_destination instead. The name of the CloudWatch log group. Either log_group_name or log_destination must be set."
  type        = string
  default     = null

}

variable "subnet_id" {
  description = "(Optional) Subnet ID to attach to."
  type        = number
  default     = null

}

variable "transit_gateway_id" {
  description = "(Optional) Transit Gateway ID to attach to"
  type        = number
  default     = null

}

variable "transit_gateway_attachment_id" {
  description = "(Optional) Transit Gateway Attachment ID to attach to"
  type        = number
  default     = null

}

variable "vpc_id" {
  description = "(Optional) VPC ID to attach to"
  type        = string
  default     = null

}

variable "max_aggregation_interval" {
  description = "(Optional) The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record."
  type        = number
  default     = null

}


variable "tags" {
  description = "(Optional) Key-value map of resource tags. "
  type        = number
  default     = null

}