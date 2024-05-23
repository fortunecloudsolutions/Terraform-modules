
variable "identifier" {
  description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier."
  type        = string
  default     = null

}
variable "allow_major" {
  description = " (Optional) Indicates that major version upgrades are allowed."
  type        = bool
}
variable "allow_minor" {
  description = " (Optional) Indicates that minor version upgrades are allowed."
  type        = bool

}
variable "engine_name" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use. "
  type        = string
}
variable "engine_version" {
  description = "The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) and this attribute will ignore differences in the patch version automatically (e.g. 5.7.17)."
  type        = string
}
variable "instance" {
  description = " The instance type of the RDS instance."
  type        = string
}
variable "storage" {
  description = " (Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes."
  type        = number
}
variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN."
  type        = bool
  default     = false
}
variable "username" {
  description = " (Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user."
  type        = string
}
variable "password" {
  description = " (Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. "
  type        = string
}
variable "port" {
  description = "The port on which the DB accepts connections."
  type        = string
}
variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  #default = false
}
variable "backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35"
  type        = number
}
variable "copy_tags_to_snapshot" {
  description = "Copy all Instance tags to snapshots"
  type        = bool
  default     = false
}
variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0."
  type        = number
}
variable "publicly_accessible" {
  description = " Bool to control if instance is publicly accessible"
  default     = false
}
variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)."
  type        = string
}
variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. "
  type        = bool
  default     = false
}
variable "license_model" {
  description = " (Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance."
  type        = string
}
variable "db_subnet_group_name" {
  description = "Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. "
  type        = string
}
variable "parameter_group_name" {
  description = "Name of the DB option group to associate."
  type        = string
  default     = null

}
variable "option_group_name" {
  description = "Name of the DB parameter group to associate."
  type        = string
  default     = null
}
variable "name" {
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. "
  type        = string
}
variable "domain" {
  description = "The ID of the Directory Service Active Directory domain to create the instance in."
  type        = string
  default     = null

}
variable "tags" {
  description = "A map of tags to assign to the resource."

}
variable "domain_iam_role_name" {
  description = " The name of the IAM role to be used when making API calls to the Directory Service."
  type        = string
  default     = null

}
variable "vpc_security_group_ids" {
  description = " List of VPC security groups to associate."
  type        = list(any)
}
variable "depends" {
  description = "depends_on"
}
variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  type        = bool
  default     = false
}
variable "availability_zone" {
  description = "The AZ for the RDS instance."
  type        = string
  default     = null
}
variable "backup_window" {
  description = " The daily time range (in UTC) during which automated backups are created if they are enabled. "
  type        = string
  default     = null
}
variable "ca_cert_identifier" {
  description = "The identifier of the CA certificate for the DB instance."
  type        = string
  default     = null
}
variable "delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted."
  type        = bool
  default     = true
}
variable "deletion_protection" {
  description = " If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  type        = bool
  default     = false
}
variable "final_snapshot_identifier" {
  description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false."
  type        = string
  default     = null
}
variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = bool
  default     = null
}
variable "iops" {
  description = "The amount of provisioned IOPS. Setting this implies a storage_type of io1"
  type        = string
  default     = null
}
variable "kms_key_id" {
  description = " The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  type        = string
  default     = null
}
variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: ddd:hh24:mi-ddd:hh24:m. Eg: Mon:00:00-Mon:03:00. "
  type        = string
  default     = null
}
variable "max_allocated_storage" {
  description = " When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. "
  type        = number
  default     = null
}
variable "monitoring_role_arn" {
  description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs."
  type        = string
  default     = null
}
variable "replicate_source_db" {
  description = "Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate "
  type        = string
  default     = null
}
variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console"
  type        = bool
  default     = null
}
variable "timezone" {
  description = "Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server."
  type        = string
  default     = null
}

variable "timeouts" {
  description = "aws_db_instance provides the following Timeouts configuration options"
  type = object({
    create = string
    update = string
    delete = string
  })
}