variable "monthly_spend_limit" {
  type        = string
  description = "(Optional) The maximum amount in USD that you are willing to spend each month to send SMS messages."
}

variable "delivery_status_iam_role_arn" {
  type        = string
  description = "(Optional) The ARN of the IAM role that allows Amazon SNS to write logs about SMS deliveries in CloudWatch Logs."
}

variable "delivery_status_success_sampling_rate" {
  type        = number
  description = "(Optional) The percentage of successful SMS deliveries for which Amazon SNS will write logs in CloudWatch Logs. The value must be between 0 and 100."
}

variable "default_sender_id" {
  type        = string
  description = "(Optional) A string, such as your business brand, that is displayed as the sender on the receiving device."
}

variable "default_sms_type" {
  type        = string
  description = "(Optional) The type of SMS message that you will send by default. Possible values are: Promotional, Transactional."
}

variable "usage_report_s3_bucket" {
  type        = string
  description = "(Optional) The name of the Amazon S3 bucket to receive daily SMS usage reports from Amazon SNS."
}