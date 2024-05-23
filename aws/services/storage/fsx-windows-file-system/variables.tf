variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  description = "The Vault URL to which vault sends and requests data"
  type        = string
}
variable "vault_token" {
  description = "The vault token, used for authorization"
  type        = string
}

variable "max_lease_seconds" {
  description = "Specifies the maximum time-to-live. If set, this overrides the global default. Must be a valid duration string"
  type        = string
}

variable "backend" {
  description = "Backend is the provider"
  type        = string
}

variable "role" {
  description = "Role is usually resources"
  type        = string
}

variable "storage_capacity" {
  type        = number
  description = "(Required) Storage capacity (GiB) of the file system. Minimum of 32 and maximum of 65536. If the storage type is set to HDD the minimum value is 2000."
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) A list of IDs for the subnets that the file system will be accessible from. To specify more than a single subnet set deployment_type to MULTI_AZ_1."
}

variable "throughput_capacity" {
  type        = number
  description = "(Required) Throughput (megabytes per second) of the file system in power of 2 increments. Minimum of 8 and maximum of 2048."
}

variable "active_directory_id" {
  type        = string
  description = "(Optional) The ID for an existing Microsoft Active Directory instance that the file system should join when it's created. Cannot be specified with self_managed_active_directory."
  default     = null
}

variable "automatic_backup_retention_days" {
  type        = number
  description = " (Optional) The number of days to retain automatic backups. Minimum of 0 and maximum of 90. Defaults to 7. Set to 0 to disable."
  default     = null
}

variable "copy_tags_to_backups" {
  type        = bool
  description = "(Optional) A boolean flag indicating whether tags on the file system should be copied to backups."
  default     = false
}

variable "daily_automatic_backup_start_time" {
  type        = string
  description = "(Optional) The preferred time (in HH:MM format) to take daily automatic backups, in the UTC time zone."
  default     = null
}

variable "kms_key_arn" {
  type        = string
  description = " (Optional) ARN for the KMS Key to encrypt the file system at rest. Defaults to an AWS managed KMS Key."
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = "(Optional) A list of IDs for the security groups that apply to the specified network interfaces created for file system access. These security groups will apply to all network interfaces."
  default     = []
}

variable "self_managed_active_directory" {
  type = object({
    dns_ips                                = list(string) # (Required) A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory. The IP addresses need to be either in the same VPC CIDR range as the file system or in the private IP version 4 (IPv4) address ranges as specified in RFC 1918
    domain_name                            = string       # (Required) The fully qualified domain name of the self-managed AD directory. For example, corp.example.com.
    password                               = string       # (Required) The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain.
    username                               = string       # (Required) The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain
    file_system_administrators_group       = string       # (Optional) The name of the domain group whose members are granted administrative privileges for the file system. Administrative privileges include taking ownership of files and folders, and setting audit controls (audit ACLs) on files and folders. The group that you specify must already exist in your domain. Defaults to Domain Admins.
    organizational_unit_distinguished_name = string       # (Optional) The fully qualified distinguished name of the organizational unit within your self-managed AD directory that the Windows File Server instance will join. For example, OU=FSx,DC=yourdomain,DC=corp,DC=com. Only accepts OU as the direct parent of the file system. If none is provided, the FSx file system is created in the default location of your self-managed AD directory. To learn more, see RFC 2253
  })
  description = "(Optional) Configuration block that Amazon FSx uses to join the Windows File Server instance to your self-managed (including on-premises) Microsoft Active Directory (AD) directory. Cannot be specified with active_directory_id."
  default     = null
}

variable "skip_final_backup" {
  type        = bool
  description = "(Optional) When enabled, will skip the default final backup taken when the file system is deleted. This configuration must be applied separately before attempting to delete the resource to have the desired behavior."
  default     = false
}

variable "tags" {
  type        = map(any)
  description = "(Optional) A map of tags to assign to the file system."
  default     = {}
}

variable "weekly_maintenance_start_time" {
  type        = string
  description = "(Optional) The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone."
  default     = null
}

variable "deployment_type" {
  type        = string
  description = "(Optional) Specifies the file system deployment type, valid values are MULTI_AZ_1 and SINGLE_AZ_1. Default value is SINGLE_AZ_1."
  default     = "SINGLE_AZ_1"
}

variable "preferred_subnet_id" {
  type        = string
  description = "(Optional) Specifies the subnet in which you want the preferred file server to be located. Required for when deployment type is MULTI_AZ_1."
  default     = null
}

variable "storage_type" {
  type        = string
  description = "(Optional) Specifies the storage type, Valid values are SSD and HDD. HDD is supported on SINGLE_AZ_1 and MULTI_AZ_1 Windows file system deployment types. Default value is SSD"
  default     = "SSD"
}

variable "timeouts" {
  description = "aws_db_instance provides the following Timeouts configuration options"
  type = object({
    create = string
    delete = string
  })
}
