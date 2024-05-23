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

variable "db_cluster_identifier" {
  type        = string
  description = "(Required) The DB Cluster Identifier from which to take the snapshot."
}

variable "db_cluster_snapshot_identifier" {
  type        = string
  description = "(Required) The Identifier for the snapshot."
}

variable "timeouts" {
  description = "aws_neptune_cluster_snapshot provides the following Timeouts configuration options:"
  type = object({
    create = string # (Default 20m) How long to wait for the snapshot to be available.
  })
}

