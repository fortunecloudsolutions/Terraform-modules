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

variable "function_name" {
  type        = string
  description = "(Required) Unique name for your Lambda Function."
}

variable "lambda_role" {
  type        = string
  description = "(Required) Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources."
}

variable "code_signing_config_arn" {
  type        = string
  description = "(Optional) To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function."
  default     = null
}

variable "dead_letter_config" {
  type = object({
    target_arn = string #(Required) ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted.

  })
  description = "(Optional) Configuration block. Detailed below."
  default     = null
}

variable "environment" {
  type = object({
    variables = map(string) #(Optional) Map of environment variables that are accessible from the function code during execution..

  })
  description = "(Optional) Configuration block. Detailed below."
  default     = null
}

variable "file_system_config" {
  type = list(object({
    arn              = string #(Required) Amazon Resource Name (ARN) of the Amazon EFS Access Point that provides access to the file system.
    local_mount_path = string #(Required) Path where the function can access the file system, starting with /mnt/.


  }))
  description = "(Optional) Configuration block. Detailed below."
  default     = null
}

variable "image_config" {
  type = object({
    command           = list(string) #(Optional) Parameters that you want to pass in with entry_point..
    entry_point       = list(string) #(Optional) Entry point to your application, which is typically the location of the runtime executable.
    working_directory = string       #(Optional) Working directory.

  })
  description = "(Optional) Configuration block. Detailed below."
  default     = null
}

variable "tracing_config" {
  type = object({

    mode = string #(Required) Whether to to sample and trace a subset of incoming requests with AWS X-Ray. Valid values are PassThrough and Active. If PassThrough, Lambda will only trace the request from an upstream service if it contains a tracing header with "sampled=1". If Active, Lambda will respect any tracing header it receives from an upstream service. If no tracing header is received, Lambda will call X-Ray for a tracing decision.

  })
  description = "(Optional) Configuration block. Detailed below."
  default     = null
}

variable "vpc_config" {
  type = object({

    security_group_ids = list(string) #(Required) List of security group IDs associated with the Lambda function.
    subnet_ids         = list(string) #(Required) List of subnet IDs associated with the Lambda function.
  })
  description = "(Optional) Configuration block. Detailed below."
  default     = null
}

variable "description" {
  type        = string
  description = "(Optional) Description of what your Lambda Function does."
  default     = null
}

variable "filename" {
  type        = string
  description = "(Optional) Path to the function's deployment package within the local filesystem. Conflicts with image_uri, s3_bucket, s3_key, and s3_object_version."
  default     = null
}

variable "handler" {
  type        = string
  description = "(Optional) Function entrypoint in your code."
  default     = null
}

variable "image_uri" {
  type        = string
  description = "(Optional) ECR image URI containing the function's deployment package. Conflicts with filename, s3_bucket, s3_key, and s3_object_version."
  default     = null
}

variable "kms_key_arn" {
  type        = string
  description = "(Optional) Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables. If this configuration is not provided when environment variables are in use, AWS Lambda uses a default service key. If this configuration is provided when environment variables are not in use, the AWS Lambda API does not save this configuration and Terraform will show a perpetual difference of adding the key. To fix the perpetual difference, remove this configuration."
  default     = null
}

variable "layers" {
  type        = list(string)
  description = "(Optional) List of Lambda Layer Version ARNs (maximum of 5) to attach to your Lambda Function. See Lambda Layers"
  default     = []
}

variable "memory_size" {
  type        = number
  description = "(Optional) Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128."
  default     = 128
}

variable "package_type" {
  type        = string
  description = "(Optional) Lambda deployment package type. Valid values are Zip and Image. Defaults to Zip."
  default     = null
}

variable "publish" {
  type        = bool
  description = "(Optional) Whether to publish creation/change as new Lambda Function Version. Defaults to false."
  default     = false
}

variable "reserved_concurrent_executions" {
  type        = number
  description = "(Optional) Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations. Defaults to Unreserved Concurrency Limits -1. "
  default     = -1
}

variable "runtime" {
  type        = string
  description = "(Optional) Identifier of the function's runtime. See Runtimes for valid values."
  default     = null
}

variable "s3_bucket" {
  type        = string
  description = "(Optional) S3 bucket location containing the function's deployment package. Conflicts with filename and image_uri. This bucket must reside in the same AWS region where you are creating the Lambda function."
  default     = null
}

variable "s3_key" {
  type        = string
  description = "(Optional) S3 key of an object containing the function's deployment package. Conflicts with filename and image_uri."
  default     = null
}

variable "s3_object_version" {
  type        = string
  description = "(Optional) Object version containing the function's deployment package. Conflicts with filename and image_uri."
  default     = null
}

variable "source_code_hash" {
  type        = string
  description = "(Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Map of tags to assign to the object. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "timeout" {
  type        = number
  description = "(Optional) Amount of time your Lambda Function has to run in seconds. Defaults to 3."
  default     = 3
}

variable "timeouts" {
  description = "aws_lambda_function provides the following Timeouts configuration options"
  type = object({
    create = string # (Default 10 minutes) How long to wait for slow uploads or EC2 throttling errors.

  })
}