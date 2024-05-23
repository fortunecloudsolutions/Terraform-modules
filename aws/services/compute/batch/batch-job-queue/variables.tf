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

variable "name" {
  type        = string
  description = "(Required) Specifies the name of the job queue."
}

variable "compute_environments" {
  type        = list(string)
  description = "(Required) Specifies the set of compute environments mapped to a job queue and their order. The position of the compute environments in the list will dictate the order."
}

variable "priority" {
  type        = number
  description = "(Required) The priority of the job queue. Job queues with a higher priority are evaluated first when associated with the same compute environment."
}

variable "state" {
  type        = string
  description = "(Required) The state of the job queue. Must be one of: ENABLED or DISABLED"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}