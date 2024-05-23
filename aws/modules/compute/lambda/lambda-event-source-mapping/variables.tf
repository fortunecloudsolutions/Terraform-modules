variable "batch_size" {
  type        = number
  description = "(Optional) The largest number of records that Lambda will retrieve from your event source at the time of invocation. Defaults to 100 for DynamoDB, Kinesis, MQ and MSK, 10 for SQS."
  default     = null
}

variable "bisect_batch_on_function_error" {
  type        = bool
  description = "(Optional) If the function returns an error, split the batch in two and retry. Only available for stream sources (DynamoDB and Kinesis). Defaults to false."
  default     = false
}

variable "enabled" {
  type        = bool
  description = "(Optional) Determines if the mapping will be enabled on creation. Defaults to true."
  default     = true
}

variable "event_source_arn" {
  type        = string
  description = "(Optional) The event source ARN - this is required for Kinesis stream, DynamoDB stream, SQS queue, MQ broker or MSK cluster. It is incompatible with a Self Managed Kafka source."
  default     = null
}

variable "function_name" {
  type        = string
  description = "(Required) The name or the ARN of the Lambda function that will be subscribing to events."
}

variable "function_response_types" {
  type        = list(string)
  description = "(Optional) A list of current response type enums applied to the event source mapping for AWS Lambda checkpointing. Only available for stream sources (DynamoDB and Kinesis). Valid values: ReportBatchItemFailures."
  default     = []
}

variable "maximum_batching_window_in_seconds" {
  type        = number
  description = "(Optional) The maximum amount of time to gather records before invoking the function, in seconds (between 0 and 300). Records will continue to buffer (or accumulate in the case of an SQS queue event source) until either maximum_batching_window_in_seconds expires or batch_size has been met. For streaming event sources, defaults to as soon as records are available in the stream. If the batch it reads from the stream/queue only has one record in it, Lambda only sends one record to the function. Only available for stream sources (DynamoDB and Kinesis) and SQS standard queues."
  default     = null
}

variable "maximum_record_age_in_seconds" {
  type        = number
  description = "(Optional) The maximum age of a record that Lambda sends to a function for processing. Only available for stream sources (DynamoDB and Kinesis). Must be either -1 (forever, and the default value) or between 60 and 604800 (inclusive)."
  default     = null
}

variable "maximum_retry_attempts" {
  type        = number
  description = "(Optional) The maximum number of times to retry when the function returns an error. Only available for stream sources (DynamoDB and Kinesis). Minimum and default of -1 (forever), maximum of 10000."
  default     = null
}

variable "parallelization_factor" {
  type        = number
  description = "(Optional) The number of batches to process from each shard concurrently. Only available for stream sources (DynamoDB and Kinesis). Minimum and default of 1, maximum of 10."
  default     = null
}

variable "queues" {
  type        = list(string)
  description = "(Optional) The name of the Amazon MQ broker destination queue to consume. Only available for MQ sources. A single queue name must be specified."
  default     = []
}

variable "self_managed_event_source" {
  type = object({
    endpoints = map(string) #(Required) A map of endpoints for the self managed source. For Kafka self-managed sources, the key should be KAFKA_BOOTSTRAP_SERVERS and the value should be a string with a comma separated list of broker endpoints.

  })
  description = "(Optional) For Self Managed Kafka sources, the location of the self managed cluster. If set, configuration must also include source_access_configuration. Detailed below."
  default     = null
}

variable "source_access_configuration" {
  type = list(object({
    type = string #(Required) The type of this configuration. For Self Managed Kafka you will need to supply blocks for type VPC_SUBNET and VPC_SECURITY_GROUP.
    uri  = string #(Required) The URI for this configuration. For type VPC_SUBNET the value should be subnet:subnet_id where subnet_id is the value you would find in an aws_subnet resource's id attribute. For type VPC_SECURITY_GROUP the value should be security_group:security_group_id where security_group_id is the value you would find in an aws_security_group resource's id attribute.
  }))
  description = "(Optional) For Self Managed Kafka sources, the access configuration for the source. If set, configuration must also include self_managed_event_source. Detailed below."
  default     = null
}

variable "destination_config" {
  type = object({
    on_failure = object({
      destination_arn = string #(Required) The Amazon Resource Name (ARN) of the destination resource.
    })
  })
  description = "(Optional) An Amazon SQS queue or Amazon SNS topic destination for failed records. Only available for stream sources (DynamoDB and Kinesis). Detailed below."
  default     = null
}

variable "starting_position" {
  type        = string
  description = "(Optional) The position in the stream where AWS Lambda should start reading. Must be one of AT_TIMESTAMP (Kinesis only), LATEST or TRIM_HORIZON if getting events from Kinesis, DynamoDB or MSK. Must not be provided if getting events from SQS. More information about these positions can be found in the AWS DynamoDB Streams API Reference and AWS Kinesis API Reference."
  default     = null
}

variable "starting_position_timestamp" {
  type        = number
  description = "(Optional) A timestamp in RFC3339 format of the data record which to start reading when using starting_position set to AT_TIMESTAMP. If a record with this exact timestamp does not exist, the next later record is chosen. If the timestamp is older than the current trim horizon, the oldest available record is chosen."
  default     = null
}

variable "topics" {
  type        = list(string)
  description = "(Optional) The name of the Kafka topics. Only available for MSK sources. A single topic name must be specified."
  default     = []
}

variable "tumbling_window_in_seconds" {
  type        = number
  description = "(Optional) The duration in seconds of a processing window for AWS Lambda streaming analytics. The range is between 1 second up to 900 seconds. Only available for stream sources (DynamoDB and Kinesis)."
  default     = null
}