variable "connections" {
  type        = list(string)
  description = "(Optional) The list of connections used for this job."
  default     = null
}

variable "default_arguments" {
  type        = map(string)
  description = "(Optional) The map of default arguments for this job. You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes. "
  default     = {}
}

variable "non_overridable_arguments" {
  type        = map(string)
  description = "(Optional) Non-overridable arguments for this job, specified as name-value pairs."
  default     = {}
}

variable "description" {
  type        = string
  description = "(Optional) Description of the job."
  default     = null
}

variable "glue_version" {
  type        = string
  description = "(Optional) The version of glue to use, for example 1.0."
  default     = null
}

variable "max_capacity" {
  type        = number
  description = "(Optional) The maximum number of AWS Glue data processing units (DPUs) that can be allocated when this job runs."
  default     = null
}

variable "max_retries" {
  type        = number
  description = "(Optional) The maximum number of times to retry this job if it fails."
  default     = null
}

variable "name" {
  type        = string
  description = "(Required) The name you assign to this job. It must be unique in your account."
}

variable "role_arn" {
  type        = string
  description = "(Required) The ARN of the IAM role associated with this job."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "timeout" {
  type        = number
  description = "(Optional) The job timeout in minutes. The default is 2880 minutes (48 hours)."
  default     = 2880
}

variable "security_configuration" {
  type        = string
  description = "(Optional) The name of the Security Configuration to be associated with the job."
  default     = null
}

variable "worker_type" {
  type        = string
  description = "(Optional) The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X."
  default     = null
}

variable "number_of_workers" {
  type        = number
  description = "(Optional) The number of workers of a defined workerType that are allocated when a job runs."
  default     = null
}

variable "command" {
  type = object({
    name            = string #(Optional) The name of the job command. Defaults to glueetl. Use pythonshell for Python Shell Job Type, max_capacity needs to be set if pythonshell is chosen.
    script_location = string #(Required) Specifies the S3 path to a script that executes a job.
    python_version  = string #(Optional) The Python version being used to execute a Python shell job. Allowed values are 2 or 3.

  })
  description = "(Required) The command of the job. Defined below."
}

variable "execution_property" {
  type = object({
    max_concurrent_runs = number #(Optional) The maximum number of concurrent runs allowed for a job. The default is 1.


  })
  description = "(Optional) Execution property of the job."
  default     = null
}

variable "notification_property" {
  type = object({
    notify_delay_after = number #(Optional) After a job run starts, the num of minutes to wait before sending a job run delay notification.

  })
  description = "(Optional) Notification property of the job."
  default     = null
}