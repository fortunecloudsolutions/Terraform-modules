variable "function_name" {
  type        = string
  description = "(Required) Name or Amazon Resource Name (ARN) of the Lambda Function, omitting any version or alias qualifier."
}

variable "maximum_event_age_in_seconds" {
  type        = number
  description = "(Optional) Maximum age of a request that Lambda sends to a function for processing in seconds. Valid values between 60 and 21600."
  default     = null
}

variable "maximum_retry_attempts" {
  type        = number
  description = "(Optional) Maximum number of times to retry when the function returns an error. Valid values between 0 and 2. Defaults to 2."
  default     = 2
}

variable "qualifier" {
  type        = string
  description = "(Optional) Lambda Function published version, $LATEST, or Lambda Alias name."
  default     = null
}

variable "destination_config" {
  type = object({
    on_failure = object({
      destination = string #(Required) Amazon Resource Name (ARN) of the destination resource.
    })
    on_success = object({
      destination = string #(Required) Amazon Resource Name (ARN) of the destination resource.
    })
  })
  description = "(Optional) Configuration block with destination configuration."
  default     = null
}
