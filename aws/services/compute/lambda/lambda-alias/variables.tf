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
  description = "(Required) Name for the alias you are creating. Pattern: (?!^[0-9]+$)([a-zA-Z0-9-_]+)"
}

variable "description" {
  type        = string
  description = "(Optional) Description of the alias."
  default     = null
}

variable "function_name" {
  type        = string
  description = "(Required) Lambda Function name or ARN."
}

variable "function_version" {
  type        = string
  description = "(Required) Lambda function version for which you are creating the alias. Pattern: ($LATEST|[0-9]+)."
}

variable "routing_config" {
  type = object({
    additional_version_weights = map(string) #(Optional) A map that defines the proportion of events that should be sent to different versions of a lambda function.

  })
  description = "(Optional) The Lambda alias' route configuration settings. Fields documented below"
  default     = null
}
