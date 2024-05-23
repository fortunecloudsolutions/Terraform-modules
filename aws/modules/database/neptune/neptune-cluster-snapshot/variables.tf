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

