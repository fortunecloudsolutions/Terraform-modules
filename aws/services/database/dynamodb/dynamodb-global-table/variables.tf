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
  description = "(Required) The name of the global table. Must match underlying DynamoDB Table names in all regions."
}

variable "replica" {
  type = list(object({
    region_name = string #(Required) AWS region name of replica DynamoDB Table. e.g. us-east-1

  }))

  description = "(Required) Underlying DynamoDB Table. At least 1 replica must be defined."

}