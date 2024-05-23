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

variable "replication_subnet_group_description" {
  description = "(Required) The description for the subnet group."
  type        = string
}

variable "replication_subnet_group_id" {
  description = "(Required) The name for the replication subnet group. This value is stored as a lowercase string. Must contain no more than 255 alphanumeric characters, periods, spaces, underscores, or hyphens. Must not be 'default'"
  type        = string
}

variable "subnet_ids" {
  description = "(Required) A list of the EC2 subnet IDs for the subnet group."
  type        = list(string)
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
