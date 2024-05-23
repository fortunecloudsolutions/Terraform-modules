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

variable "lease_ttl_seconds" {
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


#aws_efs_mount_target
variable "file_system_id" {
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to add the mount target in"
  type        = string
}

variable "ip_address" {
  description = "The address (within the address range of the specified subnet) at which the file system may be mounted via the mount target"
  type        = string
  default     = null
}

variable "security_groups" {
  description = "A list of up to 5 VPC security group IDs (that must be for the same VPC as subnet specified) in effect for the mount target"
  type        = list(any)
}