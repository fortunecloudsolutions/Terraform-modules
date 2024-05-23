variable "firehose_arn" {
  type        = string
  description = "(Required) ARN of the Amazon Kinesis Firehose delivery stream to use for this metric stream."
}

variable "role_arn" {
  type        = string
  description = "(Required) ARN of the IAM role that this metric stream will use to access Amazon Kinesis Firehose resources."
}

variable "output_format" {
  type        = string
  description = "(Required) Output format for the stream. Possible values are json and opentelemetry0.7."
}

variable "name" {
  type        = string
  description = "(Optional, Forces new resource) Friendly name of the metric stream. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique friendly name beginning with the specified prefix. Conflicts with name."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "exclude_filter" {
  type = list(object({
    namespace = string #(Required) Name of the metric namespace in the filter.

  }))
  description = "(Optional) List of exclusive metric filters. If you specify this parameter, the stream sends metrics from all metric namespaces except for the namespaces that you specify here. Conflicts with include_filter."
  default     = null
}

variable "include_filter" {
  type = list(object({
    namespace = string #(Required) Name of the metric namespace in the filter.

  }))
  description = "(Optional) List of inclusive metric filters. If you specify this parameter, the stream sends only the metrics from the metric namespaces that you specify here. Conflicts with exclude_filter."
  default     = null
}