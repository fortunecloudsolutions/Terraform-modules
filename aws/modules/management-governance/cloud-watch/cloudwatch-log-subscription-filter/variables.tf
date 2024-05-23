variable "name" {
  type        = string
  description = "(Required) A name for the subscription filter"
}

variable "destination_arn" {
  type        = string
  description = "(Required) The ARN of the destination to deliver matching log events to. Kinesis stream or Lambda function ARN."
}

variable "filter_pattern" {
  type        = string
  description = "(Required) A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events."
}

variable "log_group_name" {
  type        = string
  description = "(Required) The name of the log group to associate the subscription filter with"
}

variable "role_arn" {
  type        = string
  description = "(Optional) The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination. If you use Lambda as a destination, you should skip this argument and use aws_lambda_permission resource for granting access from CloudWatch logs to the destination Lambda function."
  default     = null
}

variable "distribution" {
  type        = string
  description = "(Optional) The method used to distribute log data to the destination. By default log data is grouped by log stream, but the grouping can be set to random for a more even distribution. This property is only applicable when the destination is an Amazon Kinesis stream. Valid values are Random and ByLogStream"
  default     = null
}