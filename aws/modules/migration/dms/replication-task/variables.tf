variable "cdc_start_time" {
  description = "(Optional) The Unix timestamp integer for the start of the Change Data Capture (CDC) operation."
  type        = number
  default     = null
}

variable "migration_type" {
  description = "(Required) The migration type. Can be one of full-load | cdc | full-load-and-cdc."
  type        = string
}

variable "replication_instance_arn" {
  description = "(Required) The Amazon Resource Name (ARN) of the replication instance."
  type        = string
}

variable "replication_task_id" {
  description = "(Required) The replication task identifier. Must contain from 1 to 255 alphanumeric characters or hyphens. First character must be a letter. Cannot end with a hyphen. Cannot contain two consecutive hyphens."
  type        = string
}

variable "replication_task_settings" {
  description = "(Optional) An escaped JSON string that contains the task settings. For a complete list of task settings, see Task Settings for AWS Database Migration Service Tasks."
  type        = string
  default     = null
}

variable "srce_endpoint_arn" {
  description = "(Required) The Amazon Resource Name (ARN) string that uniquely identifies the source endpoint."
  type        = string
}

variable "table_mappings" {
  description = "(Required) An escaped JSON string that contains the table mappings. For information on table mapping see Using Table Mapping with an AWS Database Migration Service Task to Select and Filter Data"
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "target_endpoint_arn" {
  description = "(Required) The Amazon Resource Name (ARN) string that uniquely identifies the target endpoint."
  type        = string
}