variable "queue_url" {
  type        = string
  description = "(Required) The URL of the SQS Queue to which to attach the policy"

}

variable "redrive_allow_policy" {
  type        = string
  description = "(Required) The JSON redrive allow policy for the SQS queue."

}