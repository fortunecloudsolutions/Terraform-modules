variable "bucket" {
  type        = string
  description = "(Required) The name of the source bucket that inventory lists the objects for."
}

variable "name" {
  type        = string
  description = "(Required) Unique identifier of the inventory configuration for the bucket."
}

variable "included_object_versions" {
  type        = string
  description = "(Required) Object versions to include in the inventory list."
}

variable "enabled" {
  type        = bool
  description = "(Optional, Default: true) Specifies whether the inventory is enabled or disabled."
  default     = true
}

variable "optional_fields" {
  type        = list(string)
  description = "(Optional) List of optional fields that are included in the inventory results."
  default     = null
}

variable "filter" {
  type = object({
    prefix = string # (Optional) Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria (documented below).

  })
  description = "(Optional) Specifies an inventory filter. The inventory only includes objects that meet the filter's criteria (documented below)."
  default     = null
}

variable "schedule" {
  type = object({
    frequency = string # (Required) Specifies how frequently inventory results are produced. 

  })
  description = "(Required) Specifies the schedule for generating inventory results (documented below)."
}

variable "destination" {
  type = object({
    bucket = object({
      bucket_arn = string #(Required) The Amazon S3 bucket ARN of the destination.
      account_id = string #(Optional) The ID of the account that owns the destination bucket. Recommended to be set to prevent problems if the destination bucket ownership changes.
      prefix     = string #(Optional) The prefix that is prepended to all inventory results.
      format     = string #(Required) Specifies the output format of the inventory results.
      encryption = object({
        sse_kms = object({
          key_id = string #(Required) The ARN of the KMS customer master key (CMK) used to encrypt the inventory file.
        })
        sse_s3 = object({})

      })

    })
  })
  description = "(Required) Contains information about where to publish the inventory results (documented below)."

}

/* variable "destination" {
  type        = any
  description = "(Optional) List of optional fields that are included in the inventory results."
} */

