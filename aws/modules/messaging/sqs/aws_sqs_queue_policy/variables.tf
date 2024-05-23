variable "queue_url" {
  type        = string
  description = "(Required) The URL of the SQS Queue to which to attach the policy"
}

variable "policy" {
  type        = string
  description = "(Required) The JSON policy for the SQS queue."
}

