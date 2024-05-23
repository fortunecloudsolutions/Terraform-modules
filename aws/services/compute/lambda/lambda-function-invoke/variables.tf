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

variable "function_name" {
  type        = string
  description = "(Required) Name of the lambda function."
}

variable "input" {
  type        = string
  description = "(Required) A string in JSON format that is passed as payload to the lambda function."
}

variable "qualifier" {
  type        = string
  description = "(Optional) Alias name or version number of the lambda function. e.g. $LATEST, my-alias, or 1"
  default     = null
}
