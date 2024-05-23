variable "schema_name" {
  type        = string
  description = "(Required) The Name of the schema."
}

variable "registry_arn" {
  type        = string
  description = "(Required) The ARN of the Glue Registry to create the schema in."
}

variable "data_format" {
  type        = string
  description = "(Required) The data format of the schema definition. Currently only AVRO is supported."
}

variable "compatibility" {
  type        = string
  description = "(Required) The compatibility mode of the schema. Values values are: NONE, DISABLED, BACKWARD, BACKWARD_ALL, FORWARD, FORWARD_ALL, FULL, and FULL_ALL."
}

variable "schema_definition" {
  type        = string
  description = "(Required) The schema definition using the data_format setting for schema_name."
}

variable "description" {
  type        = string
  description = "(Optional) A description of the schema."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}