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

variable "monthly_spend_limit" {
  type        = string
  description = "(Optional) The maximum amount in USD that you are willing to spend each month to send SMS messages."
  default     = null
}

variable "delivery_status_iam_role_arn" {
  type        = string
  description = "(Optional) The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs."
  default     = null
}

variable "delivery_status_success_sampling_rate" {
  type        = number
  description = "(Optional) The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value must be between 0 and 100."
  default     = null
}

variable "default_sender_id" {
  type        = string
  description = "(Optional) A string, such as your business brand, that is displayed as the sender on the receiving device."
  default     = null
}

variable "default_sms_type" {
  type        = string
  description = "(Optional) The type of SMS message that you will send by default. Possible values are: Promotional, Transactional."
  default     = null
}

variable "usage_report_s3_bucket" {
  type        = string
  description = "(Optional) The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS."
  default     = null
}