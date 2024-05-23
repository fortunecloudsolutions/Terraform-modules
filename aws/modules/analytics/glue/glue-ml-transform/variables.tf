variable "name" {
  type        = string
  description = "(Required) The name you assign to this ML Transform. It must be unique in your account."
}

variable "role_arn" {
  type        = string
  description = "(Required) The ARN of the IAM role associated with this ML Transform."
}

variable "description" {
  type        = string
  description = "(Optional) Description of the ML Transform."
  default     = null
}

variable "glue_version" {
  type        = string
  description = "(Optional) The version of glue to use, for example 1.0."
  default     = null
}

variable "max_capacity" {
  type        = number
  description = "(Optional) The number of AWS Glue data processing units (DPUs) that are allocated to task runs for this transform. You can allocate from 2 to 100 DPUs; the default is 10. max_capacity is a mutually exclusive option with number_of_workers and worker_type."
  default     = 10
}

variable "max_retries" {
  type        = number
  description = "(Optional) The maximum number of times to retry this ML Transform if it fails."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "timeout" {
  type        = number
  description = "(Optional) The ML Transform timeout in minutes. The default is 2880 minutes (48 hours)."
  default     = 2880
}

variable "worker_type" {
  type        = string
  description = "(Optional) The type of predefined worker that is allocated when an ML Transform runs. Accepts a value of Standard, G.1X, or G.2X. Required with number_of_workers."
  default     = null
}

variable "number_of_workers" {
  type        = number
  description = "(Optional) The number of workers of a defined worker_type that are allocated when an ML Transform runs. Required with worker_type."
  default     = null
}

variable "input_record_tables" {
  type = list(object({
    database_name   = string #(Required) A database name in the AWS Glue Data Catalog.
    table_name      = string #(Required) A table name in the AWS Glue Data Catalog.
    catalog_id      = string #(Optional) A unique identifier for the AWS Glue Data Catalog.
    connection_name = string #(Optional) The name of the connection to the AWS Glue Data Catalog.
  }))
  description = "(Required) A list of AWS Glue table definitions used by the transform. see Input Record Tables."
}

variable "parameters" {
  type = object({
    transform_type = string #(Required) The type of machine learning transform. For information about the types of machine learning transforms, see Creating Machine Learning Transforms.
    find_matches_parameters = object({
      accuracy_cost_trade_off    = string #(Optional) The value that is selected when tuning your transform for a balance between accuracy and cost.
      enforce_provided_labels    = bool   #(Optional) The value to switch on or off to force the output to match the provided labels from users.
      precision_recall_trade_off = string #(Optional) The value selected when tuning your transform for a balance between precision and recall.
      primary_key_column_name    = string #(Optional) The name of a column that uniquely identifies rows in the source table.
    })
  })
  description = "(Required) The algorithmic parameters that are specific to the transform type used. Conditionally dependent on the transform type. see Parameters."
}