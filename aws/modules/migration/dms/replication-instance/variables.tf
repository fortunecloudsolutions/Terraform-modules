variable "allocated_storage" {
  description = "(Optional, Default: 50, Min: 5, Max: 6144) The amount of storage (in gigabytes) to be initially allocated for the replication instance."
  type        = number
  default     = 50
}

variable "allow_major_version_upgrade" {
  description = "(Optional, Default: false) Indicates that major version upgrades are allowed."
  type        = bool
  default     = false
}

variable "apply_immediately" {
  description = "(Optional, Default: false) Indicates whether the changes should be applied immediately or during the next maintenance window. Only used when updating an existing resource."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "(Optional, Default: false) Indicates that minor engine upgrades will be applied automatically to the replication instance during the maintenance window."
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "(Optional) The EC2 Availability Zone that the replication instance will be created in."
  type        = string
  default     = null
}

variable "engine_version" {
  description = "(Optional) The engine version number of the replication instance."
  type        = string
  default     = null
}

variable "kms_key_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) for the KMS key that will be used to encrypt the connection parameters. If you do not specify a value for kms_key_arn, then AWS DMS will use your default encryption key. AWS KMS creates the default encryption key for your AWS account. Your AWS account has a different default encryption key for each AWS region."
  type        = string
  default     = null
}

variable "multi_az" {
  description = "(Optional) Specifies if the replication instance is a multi-az deployment. You cannot set the availability_zone parameter if the multi_az parameter is set to true."
  type        = bool
  default     = true
}

variable "preferred_maintenance_window" {
  description = "(Optional) The weekly time range during which system maintenance can occur, in Universal Coordinated Time (UTC). Format: ddd:hh24:mi-ddd:hh24:mi. Valid Days: mon, tue, wed, thu, fri, sat, sun.  Constraints: Minimum 30-minute window. E.g: 'sun:10:30-sun:14:30'"
  type        = string
  default     = null
}

variable "publicly_accessible" {
  description = "(Optional, Default: false) Specifies the accessibility options for the replication instance. A value of true represents an instance with a public IP address. A value of false represents an instance with a private IP address."
  type        = bool
  default     = false
}

variable "replication_instance_class" {
  description = "(Required) The compute and memory capacity of the replication instance as specified by the replication instance class. Can be one of dms.t2.micro | dms.t2.small | dms.t2.medium | dms.t2.large | dms.c4.large | dms.c4.xlarge | dms.c4.2xlarge | dms.c4.4xlarge"
  type        = string
}

variable "replication_instance_id" {
  description = "(Required) The replication instance identifier. This parameter is stored as a lowercase string.. Must contain from 1 to 63 alphanumeric characters or hyphens. First character must be a letter. Cannot end with a hyphen. Cannot contain two consecutive hyphens."
  type        = string
}

variable "replication_subnet_group_id" {
  description = "(Optional) A subnet group to associate with the replication instance"
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "vpc_security_group_ids" {
  description = "(Optional) A list of VPC security group IDs to be used with the replication instance. The VPC security groups must work with the VPC containing the replication instance."
  type        = list(string)
  default     = []
}