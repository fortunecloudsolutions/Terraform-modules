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