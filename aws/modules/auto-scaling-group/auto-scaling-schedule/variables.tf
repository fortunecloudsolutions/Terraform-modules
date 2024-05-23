variable "autoscaling_group_name" {
  type        = string
  description = "The name or Amazon Resource Name (ARN) of the Auto Scaling group"
}

variable "scheduled_action_name" {
  type        = string
  description = "The name of this scaling action."
}

variable "start_time" {
  type        = string
  description = "The time for this action to start, in 'YYYY-MM-DDThh:mm:ssZ' format in UTC/GMT only (for example, 2014-06-01T00:00:00Z ). If you try to schedule your action in the past, Auto Scaling returns an error message."
}

variable "end_time" {
  type        = string
  description = "The time for this action to end, in 'YYYY-MM-DDThh:mm:ssZ' format in UTC/GMT only (for example, 2014-06-01T00:00:00Z ). If you try to schedule your action in the past, Auto Scaling returns an error message."
}

variable "recurrence" {
  type        = string
  description = "The time when recurring future actions will start. Start time is specified by the user following the Unix cron syntax format."
}

variable "min_size" {
  type        = number
  description = "The minimum size for the Auto Scaling group. Default 0. Set to -1 if you don't want to change the minimum size at the scheduled time."
  default     = -1
}

variable "max_size" {
  type        = number
  description = "The maximum size for the Auto Scaling group. Default 0. Set to -1 if you don't want to change the maximum size at the scheduled time."
  default     = -1
}

variable "desired_capacity" {
  type        = number
  description = "The number of EC2 instances that should be running in the group. Default 0. Set to -1 if you don't want to change the desired capacity at the scheduled time."
  default     = -1
}
