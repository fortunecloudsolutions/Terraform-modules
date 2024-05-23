variable "apply_immediately" {
  type        = bool
  description = "(Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = false
}

variable "availability_zones" {
  type        = list(string)
  description = "(Optional) A list of EC2 Availability Zones that instances in the Neptune cluster can be created in."
  default     = []
}

variable "backup_retention_period" {
  type        = number
  description = "(Optional) The days to retain backups for. Default 1"
  default     = 1
}

variable "cluster_identifier" {
  type        = string
  description = "(Optional, Forces new resources) The cluster identifier. If omitted, Terraform will assign a random, unique identifier."
  default     = null
}

variable "cluster_identifier_prefix" {
  type        = string
  description = " (Optional, Forces new resource) Creates a unique cluster identifier beginning with the specified prefix. Conflicts with cluster_identifier."
  default     = null
}

variable "enable_cloudwatch_logs_exports" {
  type        = list(string)
  description = "(Optional) A list of the log types this DB cluster is configured to export to Cloudwatch Logs. Currently only supports audit."
  default     = null
}

variable "engine" {
  type        = string
  description = "(Optional) The name of the database engine to be used for this Neptune cluster. Defaults to neptune."
  default     = "neptune"
}

variable "engine_version" {
  type        = string
  description = "(Optional) The database engine version."
  default     = null
}

variable "final_snapshot_identifier" {
  type        = string
  description = "(Optional) Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. Default is false."
  default     = null
}

variable "iam_roles" {
  type        = list(string)
  description = "(Optional) A List of ARNs for the IAM roles to associate to the Neptune Cluster."
  default     = []
}

variable "iam_database_authentication_enabled" {
  type        = string
  description = "(Optional) Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  default     = false
}

variable "kms_key_arn" {
  type        = string
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_arn, storage_encrypted needs to be set to true."
  default     = null
}

variable "neptune_subnet_group_name" {
  type        = string
  description = "(Optional) A Neptune subnet group to associate with this Neptune instance."
  default     = null
}

variable "neptune_cluster_parameter_group_name" {
  type        = string
  description = "(Optional) A cluster parameter group to associate with the cluster."
  default     = null
}

variable "preferred_backup_window" {
  type        = string
  description = "(Optional) The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod parameter. Time in UTC. Default: A 30-minute window selected at random from an 8-hour block of time per region. e.g. 04:00-09:00"
  default     = null
}

variable "preferred_maintenance_window" {
  type        = string
  description = "(Optional) The weekly time range during which system maintenance can occur, in (UTC) e.g. wed:04:00-wed:04:30"
  default     = null
}

variable "port" {
  type        = string
  description = "(Optional) The port on which the Neptune accepts connections. Default is 8182."
  default     = 8182
}

variable "replication_source_identifier" {
  type        = string
  description = "(Optional) ARN of a source Neptune cluster or Neptune instance if this Neptune cluster is to be created as a Read Replica."
  default     = null
}

variable "skip_final_snapshot" {
  type        = bool
  description = "(Optional) Determines whether a final Neptune snapshot is created before the Neptune cluster is deleted. If true is specified, no Neptune snapshot is created. If false is specified, a Neptune snapshot is created before the Neptune cluster is deleted, using the value from final_snapshot_identifier. Default is false."
  default     = false
}

variable "snapshot_identifier" {
  type        = string
  description = "(Optional) Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a Neptune cluster snapshot, or the ARN when specifying a Neptune snapshot."
  default     = null
}

variable "storage_encrypted" {
  type        = bool
  description = "(Optional) Specifies whether the Neptune cluster is encrypted. The default is false if not specified."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the Neptune cluster. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "(Optional) List of VPC security groups to associate with the Cluster"
  default     = []
}

variable "deletion_protection" {
  type        = bool
  description = "(Optional) A value that indicates whether the DB cluster has deletion protection enabled.The database can't be deleted when deletion protection is enabled. By default, deletion protection is disabled."
  default     = false
}

variable "timeouts" {
  description = "aws_neptune provides the following Timeouts configuration options"
  type = object({
    create = string # (Default 120 minutes) Used for Cluster creation
    update = string #(Default 120 minutes) Used for Cluster modifications
    delete = string #(Default 120 minutes) Used for destroying cluster. This includes cleanup task during the destroying process.
  })
}