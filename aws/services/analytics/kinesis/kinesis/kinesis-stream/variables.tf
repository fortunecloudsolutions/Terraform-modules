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
  description = "(Required) A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
}

variable "shard_count" {
  type        = string
  description = "(Required) The number of shards that the stream will use. Amazon has guidelines for specifying the Stream size that should be referenced when creating a Kinesis stream."
}

variable "retention_period" {
  type        = number
  description = "(Optional) Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24."
  default     = 24
}

variable "shard_level_metrics" {
  type        = list(string)
  description = "(Optional) A list of shard-level CloudWatch metrics which can be enabled for the stream. See Monitoring with CloudWatch for more. Note that the value ALL should not be used; instead you should provide an explicit list of metrics you wish to enable."
  default     = []
}

variable "enforce_consumer_deletion" {
  type        = bool
  description = "(Optional) A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error. The default value is false."
  default     = false
}

variable "encryption_type" {
  type        = string
  description = "(Optional) The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE."
  default     = "NONE"
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) The GUID for the customer-managed KMS key to use for encryption. You can also use a Kinesis-owned master key by specifying the alias alias/aws/kinesis."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "timeouts" {
  description = "aws_kinesis_stream provides the following Timeouts configuration options:"
  type = object({
    create = string # (Default 5 minutes) Used for Creating a Kinesis Stream
    update = string #(Default 120 minutes) Used for Updating a Kinesis Stream
    delete = string # (Default 120 minutes) Used for Destroying a Kinesis Stream
  })
}