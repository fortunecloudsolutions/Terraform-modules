variable "policy_name" {
  type        = string
  description = "The name of the policy."
}

variable "autoscaling_group_name" {
  type        = string
  description = "The name of the autoscaling group."
}

variable "adjustment_type" {
  type        = string
  description = "Specifies whether the adjustment is an absolute number or a percentage of the current capacity. Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity."
}

variable "policy_type" {
  type        = string
  description = "The policy type, either 'SimpleScaling', 'StepScaling' or 'TargetTrackingScaling'. If this value isn't provided, AWS will default to 'SimpleScaling'"
  default     = "SimpleScaling"
}

variable "instance_contribute_cooldown_cloudmetric" {
  type        = number
  description = "The estimated time, in seconds, until a newly launched instance will contribute CloudWatch metrics. Without a value, AWS will default to the group's specified cooldown period."
}

variable "min_adjustment_magnitude" {
  type        = number
  description = "Minimum value to scale by when adjustment_type is set to PercentChangeInCapacity"
}

variable "cooldown" {
  type        = number
  description = "The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start."
}

variable "scaling_adjustment" {
  type        = number
  description = "The number of instances by which to scale. adjustment_type determines the interpretation of this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size). A positive increment adds to the current capacity and a negative value removes from the current capacity."
}

variable "metric_aggregation_type" {
  type        = string
  description = "The aggregation type for the policy's metrics. Valid values are 'Minimum', 'Maximum', and 'Average'. Without a value, AWS will treat the aggregation type as 'Average'."
  default     = "Average"
}

variable "step_adjustment" {
  type = list(object({
    scaling_adjustment          = number # The number of members by which to scale, when the adjustment bounds are breached. A positive value scales up. A negative value scales down.
    metric_interval_lower_bound = number # The lower bound for the difference between the alarm threshold and the CloudWatch metric. Without a value, AWS will treat this bound as infinity.
    metric_interval_upper_bound = number # The upper bound for the difference between the alarm threshold and the CloudWatch metric. Without a value, AWS will treat this bound as infinity. The upper bound must be greater than the lower bound.
  }))
  description = "A set of adjustments that manage group Step scaling"
  default     = null
}

variable "predefined_metric_specification" {
  type = object({
    predefined_metric_type = string # The metric type.
    resource_label         = number # Identifies the resource associated with the metric type.
    target_value           = number # The target value for the metric.
    disable_scale_in       = bool   # Indicates whether scale in by the target tracking policy is disabled.
  })
  description = "A predefined metric"
  default     = null
}

variable "customized_metric_specification" {
  type = object({
    metric_dimension = list(object({
      name  = string          # The name of the dimension.
      value = string          # The value of the dimension.
    }))                       # The metric type.
    metric_name      = string # Identifies the resource associated with the metric type.
    namespace        = string # The namespace of the metric.
    statistic        = string # The statistic of the metric.
    unit             = number # The unit of the metric.
    target_value     = number # The target value for the metric.
    disable_scale_in = bool   # Indicates whether scale in by the target tracking policy is disabled.
  })
  description = "A predefined metric"
  default     = null
}