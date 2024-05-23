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
##### Cloud Watch Variables

variable "cloudwatch_alarm_name" {
  type        = string
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account"
}

variable "comparison_operator" {
  type        = string
  description = "The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold are used only for alarms based on anomaly detection mode"
}

variable "evaluation_periods" {
  type        = number
  description = "The number of periods over which data is compared to the specified threshold."
}

variable "metric_name" {
  type        = string
  description = "The name for the alarm's associated metric."
  default     = null
}

variable "namespace" {
  type        = string
  description = "The namespace for the alarm's associated metric. See docs for the list of namespaces."
  default     = null
}

variable "period" {
  type        = number
  description = "The period in seconds over which the specified statistic is applied."
  default     = null
}

variable "statistic" {
  type        = string
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = null
}

variable "threshold" {
  type        = number
  description = "The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
  default     = null
}

variable "threshold_metric_id" {
  type        = string
  description = "If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function."
  default     = null
}

variable "actions_enabled" {
  type        = bool
  description = "Indicates whether or not actions should be executed during any changes to the alarm's state."
  default     = true
}

variable "alarm_actions" {
  type        = list(string)
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = null
}

variable "alarm_description" {
  type        = string
  description = "The description for the alarm."
  default     = null
}

variable "datapoints_to_alarm" {
  type        = string
  description = "The number of datapoints that must be breaching to trigger the alarm."
  default     = null
}

variable "dimensions" {
  type        = map(any)
  description = "The dimensions for the alarm's associated metric. For the list of available dimensions see the AWS documentation"
  default     = null
}

variable "insufficient_data_actions" {
  type        = list(string)
  description = "The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = null
}

variable "ok_actions" {
  type        = list(string)
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = null
}

variable "unit" {
  type        = string
  description = "The unit for the alarm's associated metric."
  default     = null
}

variable "extended_statistic" {
  type        = string
  description = "The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  default     = null
}

variable "treat_missing_data" {
  type        = string
  description = "Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing."
  default     = null
}

variable "evaluate_low_sample_count_percentiles" {
  type        = string
  description = "Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate."
  default     = null
}

variable "metric_query" {
  type = list(object({
    id          = string #A short name used to tie this object to the results in the response. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression. The valid characters are letters, numbers, and underscore. The first character must be a lowercase letter.
    expression  = string #The math expression to be performed on the returned data, if this object is performing a math expression. This expression can use the id of the other metrics to refer to those metrics, and can also use the id of other expressions to use the result of those expressions. For more information about metric math expressions, see Metric Math Syntax and Functions in the Amazon CloudWatch User Guide.
    label       = string #A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents.
    return_data = string # Specify exactly one metric_query to be true to use that metric_query result as the alarm.    
    metric = object({
      dimensions  = map(any) # The dimensions for this metric. For the list of available dimensions see the AWS documentation
      metric_name = string   # The name for this metric. 
      namespace   = string   # The namespace for this metric.
      period      = number   # The period in seconds over which the specified stat is applied.
      stat        = string   # The statistic to apply to this metric. 
      unit        = string   # The unit for this metric.
    })
  }))
  description = "Enables you to create an alarm based on a metric math expression. You may specify at most 20."
  default     = null
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(any)
  default     = {}
}

####  Auto Scaling Policy Variables
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
  default     = null
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