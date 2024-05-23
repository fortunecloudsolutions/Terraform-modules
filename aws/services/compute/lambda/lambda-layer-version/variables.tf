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

variable "layer_name" {
  type        = string
  description = "(Required) A unique name for your Lambda Layer"
}

variable "filename" {
  type        = string
  description = "(Optional) The path to the function's deployment package within the local filesystem. If defined, The s3_-prefixed options cannot be used."
  default     = null
}

variable "s3_bucket" {
  type        = string
  description = "(Optional) The S3 bucket location containing the function's deployment package. Conflicts with filename. This bucket must reside in the same AWS region where you are creating the Lambda function."
  default     = null
}

variable "s3_key" {
  type        = string
  description = "(Optional) The S3 key of an object containing the function's deployment package. Conflicts with filename."
  default     = null
}

variable "s3_object_version" {
  type        = string
  description = "(Optional) The object version containing the function's deployment package. Conflicts with filename."
  default     = null
}

variable "compatible_runtimes" {
  type        = list(string)
  description = "(Optional) A list of Runtimes this layer is compatible with. Up to 5 runtimes can be specified."
  default     = []
}

variable "description" {
  type        = string
  description = "(Optional) Description of what your Lambda Layer does."
  default     = null
}

variable "license_info" {
  type        = string
  description = "(Optional) License info for your Lambda Layer."
  default     = null
}

variable "source_code_hash" {
  type        = string
  description = "(Optional) Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
  default     = null
}