variable "destination_location_arn" {
  type        = string
  description = "(Required) Amazon Resource Name (ARN) of destination DataSync Location."
}

variable "source_location_arn" {
  type        = string
  description = "(Required) Amazon Resource Name (ARN) of source DataSync Location."
}

variable "cloudwatch_log_group_arn" {
  type        = string
  description = "(Optional) Amazon Resource Name (ARN) of the CloudWatch Log Group that is used to monitor and log events in the sync task."
  default     = null
}

variable "excludes" {
  type = object({
    filter_type = string # (Optional) The type of filter rule to apply. Valid values: SIMPLE_PATTERN.
    value       = string # (Optional) A single filter string that consists of the patterns to include or exclude. The patterns are delimited by "|" (that is, a pipe), for example: /folder1|/folder2
  })
  description = "Optional) Filter rules that determines which files to exclude from a task."
  default     = null
}

variable "name" {
  type        = string
  description = "(Optional) Name of the DataSync Task."
  default     = null
}

variable "schedule" {
  type = object({
    schedule_expression = string # (Required) Specifies the schedule you want your task to use for repeated executions. For more information, see Schedule Expressions for Rules.
  })
  description = "(Optional) Specifies a schedule used to periodically transfer files from a source to a destination location."
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Task."
  default     = {}
}

variable "options" {
  type = object({
    atime                  = string # (Optional) A file metadata that shows the last time a file was accessed (that is when the file was read or written to). If set to BEST_EFFORT, the DataSync Task attempts to preserve the original (that is, the version before sync PREPARING phase) atime attribute on all source files. Valid values: BEST_EFFORT, NONE. Default: BEST_EFFORT.
    bytes_per_second       = number # (Optional) Limits the bandwidth utilized. For example, to set a maximum of 1 MB, set this value to 1048576. Value values: -1 or greater. Default: -1 (unlimited).
    gid                    = string # (Optional) Group identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
    log_level              = string #  (Optional) Determines the type of logs that DataSync publishes to a log stream in the Amazon CloudWatch log group that you provide. Valid values: OFF, BASIC, TRANSFER. Default: OFF.
    mtime                  = string # (Optional) A file metadata that indicates the last time a file was modified (written to) before the sync PREPARING phase. Value values: NONE, PRESERVE. Default: PRESERVE.
    overwrite_mode         = string # (Optional) Determines whether files at the destination should be overwritten or preserved when copying files. Valid values: ALWAYS, NEVER. Default: ALWAYS.
    posix_permissions      = string # (Optional) Determines which users or groups can access a file for a specific purpose such as reading, writing, or execution of the file. Valid values: NONE, PRESERVE. Default: PRESERVE.
    preserve_deleted_files = string # (Optional) Whether files deleted in the source should be removed or preserved in the destination file system. Valid values: PRESERVE, REMOVE. Default: PRESERVE.
    preserve_devices       = string # (Optional) Whether the DataSync Task should preserve the metadata of block and character devices in the source files system, and recreate the files with that device name and metadata on the destination. The DataSync Task can’t sync the actual contents of such devices, because many of the devices are non-terminal and don’t return an end of file (EOF) marker. Valid values: NONE, PRESERVE. Default: NONE (ignore special devices).
    task_queueing          = string # (Optional) Determines whether tasks should be queued before executing the tasks. Valid values: ENABLED, DISABLED. Default ENABLED.
    transfer_mode          = string # (Optional) Determines whether DataSync transfers only the data and metadata that differ between the source and the destination location, or whether DataSync transfers all the content from the source, without comparing to the destination location. Valid values: CHANGED, ALL. Default: CHANGED
    uid                    = string # (Optional) User identifier of the file's owners. Valid values: BOTH, INT_VALUE, NAME, NONE. Default: INT_VALUE (preserve integer value of the ID).
    verify_mode            = string # (Optional) Whether a data integrity verification should be performed at the end of a task execution after all data and metadata have been transferred. Valid values: NONE, POINT_IN_TIME_CONSISTENT, ONLY_FILES_TRANSFERRED. Default: POINT_IN_TIME_CONSISTENT.
  })
  description = "(Required) Configuration block containing EC2 configurations for connecting to the EFS File System."
  default     = null
}