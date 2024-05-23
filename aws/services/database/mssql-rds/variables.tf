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

variable "vpc_id" {
  description = "The VPC ID to create in."
  type        = string

}
variable "subnet_id" {
  description = "The list of VPC Subnet ID to launch in."
  type        = list(any)

}
variable "security_group" {
  description = "A list of security group IDs to associate with."
  type        = list(any)

}
#dbparam_name

variable "family" {
  description = "The family of the DB parameter group."
  type        = string
}

variable "parameters" {
  description = "A list of DB parameters to apply. Note that parameters may differ from a family to an other."
  type = list(object({
    name         = string
    value        = string
    apply_method = string
  }))
}


#option_group

variable "engine_name" {
  description = "Specifies the name of the engine that this option group should be associated with."
  type        = string

}
variable "major_engine_version" {
  description = " Specifies the major version of the engine that this option group should be associated with."
  type        = string
}


variable "identifier" {
  description = "The identifier of the resource"
  type        = string
}

variable "options" {
  description = "A list of Options to apply"
  type = list(object({
    option_name                    = string       # The Name of the Option (e.g. MEMCACHED, SSAS, SSRS, SSIS)
    port                           = number       # The Port number when connecting to the Option (e.g. 11211).
    vpc_security_group_memberships = list(string) # A list of VPC Security Groups for which the option is enabled.
    option_settings = list(object({
      name  = string # The Name of the setting.
      value = string # The Value of the setting.
    }))
  }))
}



#active_directory
variable "domain_name" {
  description = "The fully qualified name for the directory, such as corp.example.com"
  type        = string
}
variable "actdir_password" {
  description = "The password for the directory administrator or connector user."
  type        = string
}
variable "netbiosname" {
  description = "The short name of the directory, such as CORP."
  type        = string
}

variable "dir_type" {
  description = "The directory type (SimpleAD, ADConnector or MicrosoftAD are accepted values). Defaults to SimpleAD."
  type        = string
}




#policy
variable "policy_arn" {
  description = "policy arn for directory access"
  type        = string
}

#RDS
variable "allow_major" {
  description = " Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type        = bool
}
variable "allow_minor" {
  description = " (Optional) Indicates that minor version upgrades are allowed."
  type        = bool
}

variable "instance" {
  description = "The instance type of the RDS instance."
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
}
variable "backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35"
  type        = number
}
variable "copy_tags_to_snapshot" {
  description = "Copy all Instance tags to snapshots"
  type        = bool
}
variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0."
  type        = number
}
variable "publicly_accessible" {
  description = " Bool to control if instance is publicly accessible"
  type        = bool
}
variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)."
  type        = string
}
variable "skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted. If true is specified, no DBSnapshot is created. "
  type        = bool
}
variable "license_model" {
  description = " (Optional, but required for some DB engines, i.e. Oracle SE1) License model information for this DB instance."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "timeouts" {
  description = "aws_db_instance provides the following Timeouts configuration options"
  type = object({
    create = string
    update = string
    delete = string
  })
}