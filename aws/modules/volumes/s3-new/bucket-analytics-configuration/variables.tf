variable "bucket" {
  type        = string
  description = "(Required) The name of the bucket this analytics configuration is associated with."
}

variable "name" {
  type        = string
  description = "(Required) Unique identifier of the analytics configuration for the bucket."
}

variable "filter" {
  type = object({
    prefix = string      # (Optional) Object prefix for filtering.
    tags   = map(string) #(Optional) Set of object tags for filtering.
  })
  description = "(Optional) Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags (documented below)."
  default     = null
}

variable "storage_class_analysis" {
  type = list(object({
    data_export = object({
      output_schema_version = string # (Optional) The schema version of exported analytics data. Allowed values: V_1.
      destination = object({
        s3_bucket_destination = object({
          bucket_arn        = string #(Required) The ARN of the destination bucket.
          bucket_account_id = string #(Optional) The account ID that owns the destination bucket.
          format            = string #(Optional) The output format of exported analytics data. Allowed values: CSV.
          prefix            = string #(Optional) The prefix to append to exported analytics data.

        })

      })
    })
  }))
  description = "(Optional) Configuration for the analytics data export (documented below)."
  default     = null

}