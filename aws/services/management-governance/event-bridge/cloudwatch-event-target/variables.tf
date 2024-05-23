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

variable "rule" {
  type        = string
  description = "(Required) The name of the rule you want to add targets to."
}

variable "event_bus_name" {
  type        = string
  description = "(Optional) The event bus to associate with the rule. If you omit this, the default event bus is used."
  default     = null
}

variable "target_id" {
  type        = string
  description = "(Optional) The unique target assignment ID. If missing, will generate a random, unique id."
  default     = null
}

variable "arn" {
  type        = string
  description = "(Required) The Amazon Resource Name (ARN) of the target."

}

variable "input" {
  type        = string
  description = "(Optional) Valid JSON text passed to the target. Conflicts with input_path and input_transformer."
  default     = null
}

variable "input_path" {
  type        = string
  description = "(Optional) The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. Conflicts with input and input_transformer."
  default     = null
}

variable "role_arn" {
  type        = string
  description = "(Optional) The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. Required if ecs_target is used or target in arn is EC2 instance, Kinesis data stream or Step Functions state machine."
  default     = null
}

variable "run_command_targets" {
  type = list(object({
    key    = string       #(Required) Can be either tag:tag-key or InstanceIds.
    values = list(string) #(Required) If Key is tag:tag-key, Values is a list of tag values. If Key is InstanceIds, Values is a list of Amazon EC2 instance IDs.
  }))

  description = "(Optional) Parameters used when you are using the rule to invoke Amazon EC2 Run Command. Documented below. A maximum of 5 are allowed."
  default     = null
}

variable "ecs_target" {
  type = object({
    group                   = string      #(Optional) Specifies an ECS task group for the task. The maximum length is 255 characters.
    launch_type             = string      #(Optional) Specifies the launch type on which your task is running. The launch type that you specify here must match one of the launch type (compatibilities) of the target task. Valid values include: an empty string "" (to specify no launch type), EC2, or FARGATE.
    platform_version        = string      #(Optional) Specifies the platform version for the task. Specify only the numeric portion of the platform version, such as 1.1.0. This is used only if LaunchType is FARGATE. 
    task_count              = number      #(Optional) The number of tasks to create based on the TaskDefinition. The default is 1.
    task_definition_arn     = string      #(Required) The ARN of the task definition to use if the event target is an Amazon ECS cluster.
    tags                    = map(string) #(Optional) A map of tags to assign to ecs resources.
    propagate_tags          = string      #(Optional) Specifies whether to propagate the tags from the task definition to the task. If no value is specified, the tags are not propagated. Tags can only be propagated to the task during task creation.
    enable_execute_command  = bool        #(Optional) Whether or not to enable the execute command functionality for the containers in this task. If true, this enables execute command functionality on all containers in the task.
    enable_ecs_managed_tags = bool        #(Optional) Specifies whether to enable Amazon ECS managed tags for the task.
    network_configuration = object({
      subnets          = list(string) #(Required) The subnets associated with the task or service.
      security_groups  = list(string) #(Optional) The security groups associated with the task or service. If you do not specify a security group, the default security group for the VPC is used.
      assign_public_ip = bool         #(Optional) Assign a public IP address to the ENI (Fargate launch type only). Valid values are true or false. Default false.
    })
    placement_constraint = list(object({
      type       = string #(Required) Type of constraint. The only valid values at this time are memberOf and distinctInstance.
      expression = string #(Optional) Cluster Query Language expression to apply to the constraint. Does not need to be specified for the distinctInstance type.

    }))
  })

  description = "(Optional) Parameters used when you are using the rule to invoke Amazon ECS Task. Documented below. A maximum of 1 are allowed."
  default     = null
}

variable "batch_target" {
  type = object({
    job_definition = string #(Required) The ARN or name of the job definition to use if the event target is an AWS Batch job. This job definition must already exist.
    job_name       = string #((Required) The name to use for this execution of the job, if the target is an AWS Batch job.
    array_size     = number #(Optional) The size of the array, if this is an array batch job. Valid values are integers between 2 and 10,000.
    job_attempts   = number #(Optional) The number of times to attempt to retry, if the job fails. Valid values are 1 to 10.

  })

  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Batch Job. Documented below. A maximum of 1 are allowed."
  default     = null
}

variable "kinesis_target" {
  type = object({
    partition_key_path = string #(Optional) The JSON path to be extracted from the event and used as the partition key.

  })

  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. Documented below. A maximum of 1 are allowed."
  default     = null
}

variable "redshift_target" {
  type = object({
    database            = string #(Required) The name of the database.
    db_user             = string #(Optional) The database user name.
    secrets_manager_arn = string #(Optional) The name or ARN of the secret that enables access to the database.
    sql                 = string #(Optional) The SQL statement text to run.
    statement_name      = string #(Optional) The name of the SQL statement.
    with_event          = bool   #(Optional) Indicates whether to send an event back to EventBridge after the SQL statement runs.
  })

  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon Kinesis Stream. Documented below. A maximum of 1 are allowed."
  default     = null
}

variable "sqs_target" {
  type = object({
    message_group_id = string #(Optional) The FIFO message group ID to use as the target.

  })

  description = "(Optional) Parameters used when you are using the rule to invoke an Amazon SQS Queue. Documented below. A maximum of 1 are allowed."
  default     = null
}

variable "http_target" {
  type = object({
    path_parameter_values   = list(string) #(Optional) The list of values that correspond sequentially to any path variables in your endpoint ARN 
    query_string_parameters = map(string)  #(Optional) Represents keys/values of query string parameters that are appended to the invoked endpoint.
    header_parameters       = map(string)  #(Optional) Enables you to specify HTTP headers to add to the request.
  })

  description = "(Optional) Parameters used when you are using the rule to invoke an API Gateway REST endpoint. Documented below. A maximum of 1 is allowed."
  default     = null
}

variable "input_transformer" {
  type = object({
    input_paths    = map(string) #(Optional) Key value pairs specified in the form of JSONPath (for example, time = $.time)
    input_template = string      #(Required) Template to customize data sent to the target. Must be valid JSON. To send a string value, the string value must include double quotes. 

  })

  description = "(Optional) Parameters used when you are providing a custom input to a target based on certain event data. Conflicts with input and input_path."
  default     = null
}

variable "retry_policy" {
  type = object({
    maximum_event_age_in_seconds = number #(Optional) The age in seconds to continue to make retry attempts.
    maximum_retry_attempts       = number #(Optional) maximum number of retry attempts to make before the request fails

  })

  description = "(Optional) Parameters used when you are providing retry policies. Documented below. A maximum of 1 are allowed."
  default     = null
}

variable "dead_letter_config" {
  type = object({
    arn = string #(Optional) - ARN of the SQS queue specified as the target for the dead-letter queue.


  })

  description = "(Optional) Parameters used when you are providing a dead letter config. Documented below. A maximum of 1 are allowed."
  default     = null
}