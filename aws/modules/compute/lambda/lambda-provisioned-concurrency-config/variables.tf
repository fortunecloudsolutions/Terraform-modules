variable "function_name" {
  type        = string
  description = "(Required) Name or Amazon Resource Name (ARN) of the Lambda Function."
}

variable "provisioned_concurrent_executions" {
  type        = number
  description = "(Required) Amount of capacity to allocate. Must be greater than or equal to 1."
}

variable "qualifier" {
  type        = string
  description = "(Required) Lambda Function version or Lambda Alias name."
}

variable "timeouts" {
  description = "aws_lambda_provisioned_concurrency_config provides the following Timeouts configuration options:"
  type = object({
    create = string # (Default 15 minutes) How long to wait for the Lambda Provisioned Concurrency Config to be ready on creation.
    update = string # (Default 15 minutes) How long to wait for the Lambda Provisioned Concurrency Config to be ready on update.
  })
}