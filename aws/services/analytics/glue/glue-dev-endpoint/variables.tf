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

variable "arguments" {
  type        = map(string)
  description = "(Optional) A map of arguments used to configure the endpoint."
  default     = {}
}

variable "extra_jars_s3_path" {
  type        = string
  description = "(Optional) Path to one or more Java Jars in an S3 bucket that should be loaded in this endpoint."
  default     = null
}

variable "extra_python_libs_s3_path" {
  type        = string
  description = "(Optional) Path(s) to one or more Python libraries in an S3 bucket that should be loaded in this endpoint. Multiple values must be complete paths separated by a comma."
  default     = null
}

variable "glue_version" {
  type        = string
  description = "(Optional) - Specifies the versions of Python and Apache Spark to use. Defaults to AWS Glue version 0.9."
  default     = null
}

variable "name" {
  type        = string
  description = "(Required) The name of this endpoint. It must be unique in your account."
  default     = null
}

variable "number_of_nodes" {
  type        = number
  description = "(Optional) The number of AWS Glue Data Processing Units (DPUs) to allocate to this endpoint. Conflicts with worker_type."
  default     = null
}

variable "number_of_workers" {
  type        = number
  description = "(Optional) The number of workers of a defined worker type that are allocated to this endpoint. This field is available only when you choose worker type G.1X or G.2X."
  default     = null
}

variable "public_key" {
  type        = string
  description = "(Optional) The public key to be used by this endpoint for authentication."
  default     = null
}

variable "public_keys" {
  type        = list(string)
  description = "(Optional) A list of public keys to be used by this endpoint for authentication."
  default     = null
}

variable "role_arn" {
  type        = string
  description = "(Required) The IAM role for this endpoint."
}

variable "security_configuration" {
  type        = string
  description = "(Optional) The name of the Security Configuration structure to be used with this endpoint."
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "(Optional) Security group IDs for the security groups to be used by this endpoint."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "(Optional) The subnet ID for the new endpoint to use."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "worker_type" {
  type        = string
  description = "(Optional) The type of predefined worker that is allocated to this endpoint. Accepts a value of Standard, G.1X, or G.2X."
  default     = null
}

