variable "agent_arns" {
  type        = list(string)
  description = "(Optional) A list of DataSync Agent ARNs with which this location will be associated."
  default     = []
}

variable "s3_bucket_arn" {
  type        = string
  description = "(Required) Amazon Resource Name (ARN) of the S3 Bucket."
}

variable "s3_config" {
  type = object({
    bucket_access_role_arn = string # (Required) Amazon Resource Names (ARN) of the IAM Role used to connect to the S3 Bucket.
  })
  description = "(Required) Configuration block containing information for connecting to S3."
}

variable "s3_storage_class" {
  type        = string
  description = "(Optional) The Amazon S3 storage class that you want to store your files in when this location is used as a task destination."
  default     = null
}

variable "subdirectory" {
  type        = string
  description = "(Required) Prefix to perform actions as source or destination."
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location."
  default     = {}
}
