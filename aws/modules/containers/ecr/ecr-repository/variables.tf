variable "name" {
  type        = string
  description = "(Required) Name of the repository."
}

variable "image_tag_mutability" {
  type        = string
  description = " (Optional) The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE. Defaults to MUTABLE."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "encryption_configuration" {
  type = object({
    encryption_type = string # (Optional) The encryption type to use for the repository. Valid values are AES256 or KMS. Defaults to AES256.
    kms_key         = string #(Optional) The ARN of the KMS key to use when encryption_type is KMS. If not specified, uses the default AWS managed key for ECR.
  })
  description = "(Optional) Encryption configuration for the repository. See below for schema."
  default     = null
}

variable "image_scanning_configuration" {
  type = object({
    scan_on_push = bool # (Required) Indicates whether images are scanned after being pushed to the repository (true) or not scanned (false).
  })
  description = " (Optional) Configuration block that defines image scanning configuration for the repository. By default, image scanning must be manually triggered."
  default     = null
}

variable "timeouts" {
  description = "aws_repository provides the following Timeouts configuration options"
  type = object({
    delete = string #(Default 20 minutes) How long to wait for a repository to be deleted.
  })
}