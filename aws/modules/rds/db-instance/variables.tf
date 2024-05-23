variable "allocated_storage" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The allocated storage in gibibytes. If max_allocated_storage is configured, this argument represents the initial storage allocation and differences from the configuration will be ignored automatically when Storage Autoscaling occurs. If replicate_source_db is set, the value is ignored during the creation of the instance."
  type        = number
  default     = null
}

variable "allow_major_version_upgrade" {
  description = "(Optional) Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
  default     = null
}

variable "apply_immediately" {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon RDS Documentation for more information."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Defaults to true."
  type        = bool
  default     = true
}

variable "availability_zone" {
  description = "(Optional) The AZ for the RDS instance."
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "(Optional) The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica."
  type        = number
  default     = null
}

variable "backup_window" {
  description = "(Optional) The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window."
  type        = string
  default     = null
}

variable "ca_cert_identifier" {
  description = "(Optional) The identifier of the CA certificate for the DB instance."
  type        = string
  default     = null
}

variable "character_set_name" {
  description = "(Optional) The character set name to use for DB encoding in Oracle and Microsoft SQL instances (collation). This can't be changed. See Oracle Character Sets Supported in Amazon RDS or Server-Level Collation for Microsoft SQL Server for more information."
  type        = string
  default     = null
}

variable "copy_tags_to_snapshot" {
  description = "(Optional, boolean) Copy all Instance tags to snapshots. Default is false."
  type        = bool
  default     = false
}

variable "db_name" {
  description = "(Optional) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines. See the AWS documentation for more details on what applies for those engines. If you are providing an Oracle db name, it needs to be in all upper case. Cannot be specified for a replica."
  type        = string
  default     = null
}

variable "db_subnet_group_name" {
  description = "(Optional) Name of DB subnet group. DB instance will be created in the VPC associated with the DB subnet group. If unspecified, will be created in the default VPC, or in EC2 Classic, if available. When working with read replicas, it should be specified only if the source database specifies an instance in another AWS Region. See DBSubnetGroupName in API action CreateDBInstanceReadReplica for additional read replica contraints."
  type        = string
  default     = null
}

variable "delete_automated_backups" {
  description = "(Optional) Specifies whether to remove automated backups immediately after the DB instance is deleted. Default is true"
  type        = bool
  default     = true
}

variable "deletion_protection" {
  description = "(Optional) If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false"
  type        = bool
  default     = false
}

variable "domain" {
  description = "(Optional) The ID of the Directory Service Active Directory domain to create the instance in."
  type        = string
  default     = null
}

variable "domain_iam_role_name" {
  description = "(Optional, but required if domain is provided) The name of the IAM role to be used when making API calls to the Directory Service."
  type        = string
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  description = "(Optional) Set of log types to enable for exporting to CloudWatch logs. If omitted, no logs will be exported. Valid values (depending on engine). MySQL and MariaDB: audit, error, general, slowquery. PostgreSQL: postgresql, upgrade. MSSQL: agent , error. Oracle: alert, audit, listener, trace."
  type        = set(string)
  default     = []
}

variable "engine" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) The database engine to use. For supported values, see the Engine parameter in API action CreateDBInstance. Cannot be specified for a replica. Note that for Amazon Aurora instances the engine must match the DB cluster's engine'. For information on the difference between the available Aurora MySQL engines see Comparison between Aurora MySQL 1 and Aurora MySQL 2 in the Amazon RDS User Guide."
  type        = string
  default     = null
}

variable "engine_version" {
  description = "(Optional) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10). The actual engine version used is returned in the attribute engine_version_actual, see Attributes Reference below. For supported values, see the EngineVersion parameter in API action CreateDBInstance. Note that for Amazon Aurora instances the engine version must match the DB cluster's engine version'. Cannot be specified for a replica."
  type        = string
  default     = null
}

variable "final_snapshot_identifier" {
  description = "(Optional) The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false. The value must begin with a letter, only contain alphanumeric characters and hyphens, and not end with a hyphen or contain two consecutive hyphens. Must not be provided when deleting a read replica."
  type        = string
  default     = null
}

variable "iam_database_authentication_enabled" {
  description = "(Optional) Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled."
  type        = string
  default     = null
}

variable "identifier" {
  description = "(Optional, Forces new resource) The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore_to_point_in_time is specified."
  type        = string
  default     = null
}

variable "identifier_prefix" {
  description = "(Optional, Forces new resource) Creates a unique identifier beginning with the specified prefix. Conflicts with identifier"
  type        = string
  default     = null
}

variable "instance_class" {
  description = "(Required) The instance type of the RDS instance."
  type        = string
}

variable "iops" {
  description = "(Optional) The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'."
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "(Optional) The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  type        = string
  default     = null
}

variable "license_model" {
  description = "(Optional, but required for some DB engines, i.e., Oracle SE1) License model information for this DB instance."
  type        = string
  default     = null
}

variable "maintenance_window" {
  description = "(Optional) The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'. See RDS Maintenance Window docs for more information."
  type        = string
  default     = null
}

variable "max_allocated_storage" {
  description = "(Optional) When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling."
  type        = number
  default     = null
}

variable "monitoring_interval" {
  description = "(Optional) The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = null
}

variable "monitoring_role_arn" {
  description = "(Optional) The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs. You can find more information on the AWS Documentation what IAM permissions are needed to allow Enhanced Monitoring for RDS Instances."
  type        = string
  default     = null
}

variable "multi_az" {
  description = "(Optional) Specifies if the RDS instance is multi-AZ"
  type        = string
  default     = null
}

# variable "name" {
#   description = "(Optional, Deprecated use db_name instead) The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance. Note that this does not apply for Oracle or SQL Server engines. See the AWS documentation for more details on what applies for those engines. If you are providing an Oracle db name, it needs to be in all upper case. Cannot be specified for a replica."
#   type        = string
#   default     = null
# }

variable "nchar_character_set_name" {
  description = "(Optional, Forces new resource) The national character set is used in the NCHAR, NVARCHAR2, and NCLOB data types for Oracle instances. This can't be changed. See Oracle Character Sets Supported in Amazon RDS."
  type        = string
  default     = null
}

variable "network_type" {
  description = "(Optional) The network type of the DB instance. Valid values: IPV4, DUAL"
  type        = string
  default     = null
}

variable "option_group_name" {
  description = "(Optional) Name of the DB option group to associate."
  type        = string
  default     = null
}

variable "parameter_group_name" {
  description = "(Optional) Name of the DB parameter group to associate."
  type        = string
  default     = null
}

variable "password" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type        = string
}

variable "performance_insights_enabled" {
  description = "(Optional) Specifies whether Performance Insights are enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "(Optional) The ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true. Once KMS key is set, it can never be changed."
  type        = string
  default     = null
}

variable "performance_insights_retention_period" {
  description = "(Optional) Amount of time in days to retain Performance Insights data. Valid values are 7, 731 (2 years) or a multiple of 31. When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true. Defaults to '7'."
  type        = number
  default     = 7
}

variable "port" {
  description = "(Optional) The port on which the DB accepts connections."
  type        = number
  default     = null
}

variable "publicly_accessible" {
  description = "(Optional) Bool to control if instance is publicly accessible. Default is false."
  type        = bool
  default     = false
}

variable "replica_mode" {
  description = "(Optional) Specifies whether the replica is in either mounted or open-read-only mode. This attribute is only supported by Oracle instances. Oracle replicas operate in open-read-only mode unless otherwise specified. See Working with Oracle Read Replicas for more information."
  type        = string
  default     = null
}

variable "replicate_source_db" {
  description = "(Optional) Specifies that this resource is a Replicate database, and to use this value as the source database. This correlates to the identifier of another Amazon RDS Database to replicate (if replicating within a single region) or ARN of the Amazon RDS Database to replicate (if replicating cross-region). Note that if you are creating a cross-region replica of an encrypted database you will also need to specify a kms_key_id. See DB Instance Replication and Working with PostgreSQL and MySQL Read Replicas for more information on using Replication."
  type        = string
  default     = null
}

variable "restore_to_point_in_time" {
  description = "(Optional, Forces new resource) A configuration block for restoring a DB instance to an arbitrary point in time. Requires the identifier argument to be set with the name of the new DB instance to be created. See Restore To Point In Time below for details."
  type = object({
    restore_time                             = string # (Optional) The date and time to restore from. Value must be a time in Universal Coordinated Time (UTC) format and must be before the latest restorable time for the DB instance. Cannot be specified with use_latest_restorable_time.
    source_db_instance_identifier            = string # (Optional) The identifier of the source DB instance from which to restore. Must match the identifier of an existing DB instance. Required if source_db_instance_automated_backups_arn or source_dbi_resource_id is not specified.
    source_db_instance_automated_backups_arn = string # (Optional) The ARN of the automated backup from which to restore. Required if source_db_instance_identifier or source_dbi_resource_id is not specified.
    source_dbi_resource_id                   = string # (Optional) The resource ID of the source DB instance from which to restore. Required if source_db_instance_identifier or source_db_instance_automated_backups_arn is not specified.
    use_latest_restorable_time               = bool   #  (Optional) A boolean value that indicates whether the DB instance is restored from the latest backup time. Defaults to false. Cannot be specified with restore_time.
  })
  default = null
}

variable "s3_import" {
  description = "(Optional) Restore from a Percona Xtrabackup in S3. See Importing Data into an Amazon RDS MySQL DB Instance"
  type = object({
    bucket_name           = string # (Required) The bucket name where your backup is stored
    bucket_prefix         = string # (Optional) Can be blank, but is the path to your backup
    ingestion_role        = string # (Required) Role applied to load the data.
    source_engine         = string # (Required, as of Feb 2018 only 'mysql' supported) Source engine for the backup
    source_engine_version = string # (Required, as of Feb 2018 only '5.6' supported) Version of the source engine used to make the backup
  })
  default = null
}

# variable "security_group_names" {
#   description = "(Optional/Deprecated) List of DB Security Groups to associate. Only used for DB Instances on the EC2-Classic Platform."
#   type        = list(string)
#   default     = []
# }

variable "skip_final_snapshot" {
  description = "(Optional) Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. If false is specified, a DB snapshot is created before the DB instance is deleted, using the value from final_snapshot_identifier. Default is false."
  type        = bool
  default     = false
}

variable "snapshot_identifier" {
  description = "(Optional) Specifies whether or not to create this database from a snapshot. This correlates to the snapshot ID you'd find in the RDS console, e.g: rds:production-2015-06-26-06-05."
  type        = string
  default     = null
}

variable "storage_encrypted" {
  description = "(Optional) Specifies whether the DB instance is encrypted. Note that if you are creating a cross-region read replica this field is ignored and you should instead declare kms_key_id with a valid ARN. The default is false if not specified."
  type        = bool
  default     = false
}

variable "storage_type" {
  description = "(Optional) One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(any)
  default     = {}
}

variable "timezone" {
  description = "(Optional) Time zone of the DB instance. timezone is currently only supported by Microsoft SQL Server. The timezone can only be set on creation. See MSSQL User Guide for more information."
  type        = string
  default     = null
}

variable "username" {
  description = "(Required unless a snapshot_identifier or replicate_source_db is provided) Username for the master DB user. Cannot be specified for a replica"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "(Optional) List of VPC security groups to associate."
  type        = list(string)
  default     = []
}

variable "customer_owned_ip_enabled" {
  description = "(Optional) Indicates whether to enable a customer-owned IP address (CoIP) for an RDS on Outposts DB instance. See CoIP for RDS on Outposts for more information."
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