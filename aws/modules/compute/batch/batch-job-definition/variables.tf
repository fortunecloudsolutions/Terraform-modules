variable "name" {
  type        = string
  description = "(Required) Specifies the name of the job definition."
}

variable "container_properties" {
  type        = string
  description = "(Optional) A valid container properties provided as a single valid JSON document. This parameter is required if the type parameter is container."
  default     = null
}

variable "parameters" {
  type        = map(string)
  description = "(Optional) Specifies the parameter substitution placeholders to set in the job definition."
  default     = null
}

variable "platform_capabilities" {
  type        = list(string)
  description = "(Optional) The platform capabilities required by the job definition. If no value is specified, it defaults to EC2. To run the job on Fargate resources, specify FARGATE."
  default     = null
}

variable "propagate_tags" {
  type        = bool
  description = "(Optional) Specifies whether to propagate the tags from the job definition to the corresponding Amazon ECS task. Default is false.(Optional) Specifies whether to propagate the tags from the job definition to the corresponding Amazon ECS task. Default is false.(Optional) Specifies whether to propagate the tags from the job definition to the corresponding Amazon ECS task. Default is false."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = null
}

variable "type" {
  type        = string
  description = "(Required) The type of job definition. Must be container."

}

variable "retry_strategy" {
  type = object({
    attempts = number # (Optional) The number of times to move a job to the RUNNABLE status. You may specify between 1 and 10 attempts

    evaluate_on_exit = list(object({
      action           = string #(Required) Specifies the action to take if all of the specified conditions are met. The values are not case sensitive. Valid values: RETRY, EXIT.
      on_exit_code     = number # (Optional) A glob pattern to match against the decimal representation of the exit code returned for a job.
      on_reason        = string #(Optional) A glob pattern to match against the reason returned for a job.
      on_status_reason = string #(Optional) A glob pattern to match against the status reason returned for a job.

    }))

  })
  description = "(Optional) Specifies the retry strategy to use for failed jobs that are submitted with this job definition. Maximum number of retry_strategy is 1. Defined below."
  default     = null
}

variable "timeout" {
  type = object({
    attempt_duration_seconds = number # (Optional) The time duration in seconds after which AWS Batch terminates your jobs if they have not finished. The minimum value for the timeout is 60 seconds.



  })
  description = "(Optional) Specifies the timeout for jobs so that if a job runs longer, AWS Batch terminates the job. Maximum number of timeout is 1. Defined below."
  default     = null
}