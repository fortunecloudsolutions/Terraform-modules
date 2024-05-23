variable "name" {
  type        = string
  description = "(Required) The name of the trigger."
}

variable "description" {
  type        = string
  description = "(Optional) A description of the new trigger."
  default     = null
}

variable "enabled" {
  type        = bool
  description = "(Optional) Start the trigger. Defaults to true."
  default     = true
}

variable "schedule" {
  type        = string
  description = "(Optional) A cron expression used to specify the schedule. "
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "type" {
  type        = string
  description = "(Required) The type of trigger. Valid values are CONDITIONAL, ON_DEMAND, and SCHEDULED."
}

variable "workflow_name" {
  type        = string
  description = "(Optional) A workflow to which the trigger should be associated to. Every workflow graph (DAG) needs a starting trigger (ON_DEMAND or SCHEDULED type) and can contain multiple additional CONDITIONAL triggers."
  default     = null
}

variable "actions" {
  type = list(object({
    arguments              = map(string) #(Optional) Arguments to be passed to the job. You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes.
    crawler_name           = string      #(Optional) The name of the crawler to be executed. Conflicts with job_name.
    job_name               = string      #(Optional) The name of a job to be executed. Conflicts with crawler_name.
    timeout                = number      #(Optional) The job run timeout in minutes. It overrides the timeout value of the job.
    security_configuration = string      #(Optional) The name of the Security Configuration structure to be used with this action.
    notification_property = object({
      notify_delay_after = number #(Optional) After a job run starts, the number of minutes to wait before sending a job run delay notification.
    })
  }))
  description = "(Required) List of actions initiated by this trigger when it fires. See Actions Below."
}

variable "predicate" {
  type = object({
    logical = string #(Optional) How to handle multiple conditions. Defaults to AND. Valid values are AND or ANY.
    conditions = list(object({
      job_name         = string #(Optional) The name of the job to watch. If this is specified, state must also be specified. Conflicts with crawler_name.
      state            = string #(Optional) The condition job state. Currently, the values supported are SUCCEEDED, STOPPED, TIMEOUT and FAILED. If this is specified, job_name must also be specified. Conflicts with crawler_state.
      crawler_name     = string #(Optional) The name of the crawler to watch. If this is specified, crawl_state must also be specified. Conflicts with job_name.
      crawl_state      = string #(Optional) The condition crawl state. Currently, the values supported are RUNNING, SUCCEEDED, CANCELLED, and FAILED. If this is specified, crawler_name must also be specified. Conflicts with state.
      logical_operator = string #(Optional) A logical operator. Defaults to EQUALS.

    }))
  })
  description = "(Optional) A predicate to specify when the new trigger should fire. Required when trigger type is CONDITIONAL."
  default     = null
}

variable "timeouts" {
  description = "aws_glue_trigger provides the following Timeouts configuration options:"
  type = object({
    create = string # (Default 5m) How long to wait for a trigger to be created.
    delete = string # (Default 5m) How long to wait for a trigger to be deleted.
  })
}