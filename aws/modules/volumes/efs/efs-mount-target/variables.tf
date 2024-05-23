#aws_efs_mount_target

variable "file_system_id" {
  description = "The ID of the file system for which the mount target is intended."
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