variable "bucket" {
  type        = string
  description = "(Required) The name of the bucket that you want to associate this access point with."
}

variable "rule" {
  type = list(object({
    object_ownership = string #(Optional) Object ownership. Valid values: BucketOwnerPreferred or ObjectWriter
  }))
  description = "(Required) Configuration block(s) with Ownership Controls rules. Detailed below."
}