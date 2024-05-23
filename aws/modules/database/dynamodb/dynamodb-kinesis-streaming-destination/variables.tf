variable "stream_arn" {
  type        = string
  description = "(Required) The ARN for a Kinesis data stream. This must exist in the same account and region as the DynamoDB table."
}

variable "table_name" {
  type        = string
  description = "(Required) The name of the DynamoDB table. There can only be one Kinesis streaming destination for a given DynamoDB table."
}
