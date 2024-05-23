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

variable "alarm_name" {
  type        = string
  description = "(Required) The descriptive name for the alarm. This name must be unique within the user's AWS account"
}

variable "comparison_operator" {
  type        = string
  description = "(Required) The arithmetic operation to use when comparing the specified Statistic and Threshold. The specified Statistic value is used as the first operand. Either of the following is supported: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold. Additionally, the values LessThanLowerOrGreaterThanUpperThreshold, LessThanLowerThreshold, and GreaterThanUpperThreshold are used only for alarms based on anomaly detection models."
}

variable "evaluation_periods" {
  type        = string
  description = "(Required) The number of periods over which data is compared to the specified threshold."
}

variable "metric_name" {
  type        = string
  description = "(Optional) The name for the alarm's associated metric. See docs for supported metrics."
  default     = null
}

variable "namespace" {
  type        = string
  description = "(Optional) The namespace for the alarm's associated metric. See docs for the list of namespaces. See docs for supported metrics."
  default     = null
}

variable "period" {
  type        = string
  description = "(Optional) The period in seconds over which the specified statistic is applied."
  default     = null
}

variable "statistic" {
  type        = string
  description = "(Optional) The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  default     = null
}

variable "threshold" {
  type        = string
  description = "(Optional) The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
  default     = null
}

variable "threshold_metric_id" {
  type        = string
  description = "(Optional) If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function."
  default     = null
}

variable "actions_enabled" {
  type        = bool
  description = "(Optional) If this is an alarm based on an anomaly detection model, make this value match the ID of the ANOMALY_DETECTION_BAND function."
  default     = false
}

variable "alarm_actions" {
  type        = list(string)
  description = "(Optional) The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = []
}

variable "alarm_description" {
  type        = string
  description = "(Optional) The description for the alarm."
  default     = null
}

variable "datapoints_to_alarm" {
  type        = number
  description = "(Optional) The number of datapoints that must be breaching to trigger the alarm."
  default     = null
}

variable "dimensions" {
  type        = map(string)
  description = "(Optional)The dimensions for the alarm's associated metric. For the list of available dimensions see the AWS documentation"
  default     = {}
}

variable "insufficient_data_actions" {
  type        = list(string)
  description = "(Optional)The list of actions to execute when this alarm transitions into an INSUFFICIENT_DATA state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = null
}

variable "ok_actions" {
  type        = list(string)
  description = "(Optional)The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)."
  default     = null
}

variable "unit" {
  type        = string
  description = "(Optional)The unit for the alarm's associated metric."
  default     = null
}

variable "extended_statistic" {
  type        = string
  description = "(Optional)The percentile statistic for the metric associated with the alarm. Specify a value between p0.0 and p100."
  default     = null
}

variable "treat_missing_data" {
  type        = string
  description = "(Optional)Sets how this alarm is to handle missing data points. The following values are supported: missing, ignore, breaching and notBreaching. Defaults to missing."
  default     = null
}

variable "evaluate_low_sample_count_percentiles" {
  type        = string
  description = "(Optional)Used only for alarms based on percentiles. If you specify ignore, the alarm state will not change during periods with too few data points to be statistically significant. If you specify evaluate or omit this parameter, the alarm will always be evaluated and possibly change state no matter how many data points are available. The following values are supported: ignore, and evaluate."
  default     = null
}

variable "metric_query" {
  type = list(object({
    id          = string #(Required)A short name used to tie this object to the results in the response. If you are performing math expressions on this set of data, this name represents that data and can serve as a variable in the mathematical expression. The valid characters are letters, numbers, and underscore. The first character must be a lowercase letter.
    account_id  = string #(Optional) The ID of the account where the metrics are located, if this is a cross-account alarm.
    expression  = string #(Optional)The math expression to be performed on the returned data, if this object is performing a math expression. This expression can use the id of the other metrics to refer to those metrics, and can also use the id of other expressions to use the result of those expressions. For more information about metric math expressions, see Metric Math Syntax and Functions in the Amazon CloudWatch User Guide.
    label       = string #(Optional)A human-readable label for this metric or expression. This is especially useful if this is an expression, so that you know what the value represents.
    return_data = string # (Optional)Specify exactly one metric_query to be true to use that metric_query result as the alarm.    
    metric = object({
      dimensions  = map(string) # (Optional)The dimensions for this metric. For the list of available dimensions see the AWS documentation
      metric_name = string      # (Required)The name for this metric. 
      namespace   = string      # (Required)The namespace for this metric.
      period      = number      # (Required)The period in seconds over which the specified stat is applied.
      stat        = string      # (Required)The statistic to apply to this metric. 
      unit        = string      # (Optional)The unit for this metric.
    })
  }))
  description = "(Optional)Enables you to create an alarm based on a metric math expression. You may specify at most 20."
  default     = null
}


variable "tags" {
  description = "(Optional)A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
