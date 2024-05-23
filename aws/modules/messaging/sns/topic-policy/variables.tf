variable "topic_arn" {
  type        = string
  description = "(Required) The ARN of the SNS topic."
}

variable "topic_policy" {
  type        = string
  description = "(Required)The fully-formed AWS policy as JSON. This policy defines who can access your topic. By default, only the topic owner can publish or subscribe to the topic."
}
