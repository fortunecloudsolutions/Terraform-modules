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

variable "cluster_identifier" {
  type        = string
  description = "(Required, Forces new resources) The DB cluster identifier of the DB cluster associated with the endpoint."
}

variable "cluster_endpoint_identifier" {
  type        = string
  description = "(Required, Forces new resources) The identifier of the endpoint."
}

variable "endpoint_type" {
  type        = string
  description = "(Required) The type of the endpoint. One of: READER, WRITER, ANY."
}

variable "excluded_members" {
  type        = list(string)
  description = "(Optional) List of DB instance identifiers that aren't part of the custom endpoint group. All other eligible instances are reachable through the custom endpoint. Only relevant if the list of static members is empty."
  default     = []
}

variable "static_members" {
  type        = list(string)
  description = "(Optional) List of DB instance identifiers that are part of the custom endpoint group."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the Neptune cluster. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

