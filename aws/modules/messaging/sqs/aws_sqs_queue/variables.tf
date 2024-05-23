variable "name" {
  type        = string
  description = "(Optional) The name of the queue. Queue names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 80 characters long. For a FIFO (first-in-first-out) queue, the name must end with the .fifo suffix. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  default     = null
}

variable "visibility_timeout_seconds" {
  type        = number
  description = "(Optional) The visibility timeout for the queue. An integer from 0 to 43200 (12 hours)."
  default     = null
}

variable "message_retention_seconds" {
  type        = number
  description = "(Optional) The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days)."
  default     = null
}

variable "max_message_size" {
  type        = number
  description = " (Optional) The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB)."
  default     = null
}

variable "delay_seconds" {
  type        = number
  description = "(Optional) The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds."
  default     = null
}

variable "receive_wait_time_seconds" {
  type        = number
  description = "(Optional) The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately."
  default     = null
}

variable "policy" {
  type        = string
  description = "(Optional) The JSON policy for the SQS queue. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  default     = null
}

variable "redrive_policy" {
  type        = string
  description = "(Optional) The JSON policy to set up the Dead Letter Queue, see AWS docs."
  default     = null
}

variable "redrive_allow_policy" {
  type        = string
  description = "(Optional) The JSON policy to set up the Dead Letter Queue redrive permission"
  default     = null
}

variable "fifo_queue" {
  type        = bool
  description = "(Optional) Boolean designating a FIFO queue. If not set, it defaults to false making it standard."
  default     = false
}

variable "content_based_deduplication" {
  type        = bool
  description = "(Optional) Enables content-based deduplication for FIFO queues."
  default     = false
}
variable "sqs_managed_sse_enabled" {
  type        = bool
  description = "(Optional) Boolean to enable server-side encryption (SSE) of message content with SQS-owned encryption keys. "
  default     = false
}

variable "kms_master_key_id" {
  type        = string
  description = "(Optional) The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
  default     = null
}

variable "kms_data_key_reuse_period_seconds" {
  type        = number
  description = "(Optional) The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours). The default is 300 (5 minutes)."
  default     = null
}

variable "deduplication_scope" {
  type        = string
  description = "(Optional) Specifies whether message deduplication occurs at the message group or queue level. Valid values are messageGroup and queue (default)."
  default     = "queue"
}

variable "fifo_throughput_limit" {
  type        = string
  description = "(Optional) Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are perQueue (default) and perMessageGroupId."
  default     = "perQueue"
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the queue. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}