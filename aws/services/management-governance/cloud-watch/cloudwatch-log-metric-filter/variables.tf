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

variable "name" {
  type        = string
  description = "(Required) A name for the metric filter."
}

variable "pattern" {
  type        = string
  description = "(Required) A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events."
}

variable "log_group_name" {
  type        = string
  description = "(Required) The name of the log group to associate the metric filter with."
}

variable "metric_transformation" {
  type = object({
    name          = string      #(Required) The name of the CloudWatch metric to which the monitored log information should be published (e.g. ErrorCount).
    namespace     = string      #(Required) The destination namespace of the CloudWatch metric.
    value         = string      #(Required) What to publish to the metric. For example, if you're counting the occurrences of a particular term like "Error", the value will be "1" for each occurrence. If you're counting the bytes transferred the published value will be the value in the log event.
    default_value = string      #(Optional) The value to emit when a filter pattern does not match a log event. Conflicts with dimensions.
    dimensions    = map(string) #(Optional) Map of fields to use as dimensions for the metric. Up to 3 dimensions are allowed. Conflicts with default_value.
    unit          = string      #(Optional) The unit to assign to the metric. If you omit this, the unit is set as None.
  })

  description = "(Required) A block defining collection of information needed to define how metric data gets emitted. See below."

}