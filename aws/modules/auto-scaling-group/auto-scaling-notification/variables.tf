variable "asg_group_names" {
  type        = list(string)
  description = "A list of AutoScaling Group Names"
}

variable "notification_types" {
  type        = list(string)
  description = "A list of Notification Types that trigger notifications."
}

variable "topic_arn" {
  type        = string
  description = "The Topic ARN for notifications to be sent through"
}