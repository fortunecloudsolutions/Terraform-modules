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

variable "apply_immediately" {
  type        = bool
  description = "(Optional) Specifies whether any instance modifications are applied immediately, or during the next maintenance window. Default isfalse."
  default     = false
}

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "(Optional) Indicates that minor engine upgrades will be applied automatically to the instance during the maintenance window. Default is true."
  default     = true
}

variable "availability_zone" {
  type        = string
  description = "(Optional) Specifies whether any instance modifications are applied immediately, or during the next maintenance window. Default isfalse."
  default     = null
}

variable "cluster_identifier" {
  type        = string
  description = "(Required) The identifier of the aws_neptune_cluster in which to launch this instance."
}

variable "engine" {
  type        = string
  description = "(Optional) The name of the database engine to be used for the neptune instance. Defaults to neptune. Valid Values: neptune."
  default     = "neptune"
}

variable "engine_version" {
  type        = string
  description = "(Optional) The neptune engine version."
  default     = null
}

variable "identifier" {
  type        = string
  description = "(Optional, Forces new resource) The identifier for the neptune instance, if omitted, Terraform will assign a random, unique identifier."
  default     = null
}

variable "identifier_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique identifier beginning with the specified prefix. Conflicts with identifier."
  default     = null
}

variable "instance_class" {
  type        = string
  description = "(Required) The instance class to use."
}

variable "neptune_subnet_group_name" {
  type        = string
  description = "(Required if publicly_accessible = false, Optional otherwise) A subnet group to associate with this neptune instance. NOTE: This must match the neptune_subnet_group_name of the attached aws_neptune_cluster."
}

variable "neptune_parameter_group_name" {
  type        = string
  description = "(Optional) The name of the neptune parameter group to associate with this instance."
  default     = null
}

variable "port" {
  type        = string
  description = "(Optional) The port on which the DB accepts connections. Defaults to 8182."
  default     = "8182"
}

variable "preferred_backup_window" {
  type        = string
  description = "(Optional) The daily time range during which automated backups are created if automated backups are enabled."
  default     = null
}

variable "preferred_maintenance_window" {
  type        = string
  description = "(Optional) The window to perform maintenance in."
  default     = null
}

variable "promotion_tier" {
  type        = number
  description = "(Optional) Default 0. Failover Priority setting on instance level. The reader who has lower tier has higher priority to get promoter to writer."
  default     = 0
}

variable "publicly_accessible" {
  type        = bool
  description = "(Optional) Bool to control if instance is publicly accessible. Default is false."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the instance. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "timeouts" {
  description = "aws_neptune_cluster_instance provides the following Timeouts configuration options:"
  type = object({
    create = string # (Default 90 minutes) How long to wait for creating instances to become available.
    update = string # (Default 90 minutes) How long to wait for creating instances to become available.
    delete = string # (Default 90 minutes) How long to wait for deleting instances to become fully deleted.
  })
}