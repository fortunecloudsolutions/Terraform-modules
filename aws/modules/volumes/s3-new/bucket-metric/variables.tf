variable "bucket" {
  type        = string
  description = "(Required) The name of the bucket to put metric configuration."
}

variable "name" {
  type        = string
  description = "(Required) Unique identifier of the metrics configuration for the bucket."
}

variable "filter" {
  type = object({
    prefix = string #(Optional) Object prefix for filtering (singular).
    tags  = map(string) #(Optional) Object tags for filtering (up to 10).
  })
  description = "(Optional) Object filtering that accepts a prefix, tags, or a logical AND of prefix and tags (documented below)."
  default     = null
}