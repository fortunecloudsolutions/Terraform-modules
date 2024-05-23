variable "topic_arn" {
  type        = string
  description = "(Required) The ARN of the SNS topic to subscribe to."
}

variable "protocol" {
  type        = string
  description = "(Required) The protocol to use. The possible values for this are: sqs, sms, lambda, application. (http or https are partially supported, see below) (email is an option but is unsupported, see below)."
}

variable "endpoint" {
  type        = string
  description = "(Required) The endpoint to send data to, the contents will vary with the protocol."
}

variable "endpoint_auto_confirms" {
  type        = bool
  description = "(Optional) Boolean indicating whether the end point is capable of auto confirming subscription e.g., PagerDuty (default is false)"
  default     = null
}

variable "confirmation_timeout_in_minutes" {
  type        = number
  description = "(Optional) Integer indicating number of minutes to wait in retying mode for fetching subscription arn before marking it as failure. Only applicable for http and https protocols (default is 1 minute)."
  default     = null
}

variable "raw_message_delivery" {
  type        = bool
  description = "(Optional) Boolean indicating whether or not to enable raw message delivery (the original message is directly passed, not wrapped in JSON with the original message in the message property) (default is false)."
  default     = null
}

variable "filter_policy" {
  type        = string
  description = "(Optional) JSON String with the filter policy that will be used in the subscription to filter messages seen by the target resource. Refer to the SNS docs for more details."
  default     = null
}

variable "delivery_policy" {
  type        = string
  description = "(Optional) JSON String with the delivery policy (retries, backoff, etc.) that will be used in the subscription - this only applies to HTTP/S subscriptions. Refer to the SNS docs for more details."
  default     = null
}