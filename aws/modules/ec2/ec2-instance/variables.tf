# ec2 details
variable "ami" {
  description = "The AMI to use for the instance."
  type        = string

}
variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "key_name" {
  description = "The key name of the instance"
  type        = string
}
variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC."
  type        = bool
}

variable "user_data1" {
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument."
  default     = null
}
variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized."
  type        = bool
  default     = null
}
variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled. "
  type        = bool
  default     = null
}

variable "get_password_data" {
  description = "If true, wait for password data to become available and retrieve it. "
  type        = bool
  default     = null
}

variable "availability_zone" {
  description = "The AZ to start the instance in."
  type        = string
  default     = null
}
variable "subnet_id" {
  description = "The VPC Subnet ID to launch in."
  type        = string
  default     = null
}
variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with."
  type        = list(any)
  default     = null
}
variable "instance_type" {
  description = " The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
  type        = string
}
variable "placement_group" {
  description = "The Placement Group to start the instance in."
  type        = string
  default     = null
}
variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware."
  type        = string
  default     = null
}
variable "host_id" {
  description = "The Id of a dedicated host that the instance will be assigned to. "
  type        = string
  default     = null
}
variable "cpu_core_count" {
  description = "Sets the number of CPU cores for an instance. "
  type        = number
  default     = null
}
variable "cpu_threads_per_core" {
  description = " If set to to 1, hyperthreading is disabled on the launched instance."
  type        = number
  default     = null
}
variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = null

}
variable "instance_initiated_shutdown_behavior" {
  description = " Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances."
  type        = string
  default     = null
}
/*variable security_groups {
  description = "A list of security group names (EC2-Classic) or IDs (default VPC) to associate with."
  type = string
  default = []
}*/
variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC."
  type        = string
  default     = null
}
variable "secondary_private_ips" {
  description = " A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. "
  type        = list(any)
  default     = null
}
variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance."
  type        = bool
  default     = true
}
variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  type        = string
  default     = null
}

variable "hibernation" {
  description = "If true, the launched EC2 instance will support hibernation."
  type        = bool
  default     = false
}
variable "root_block_device" {
  description = "root block device attributes control a portion of the AWS Instance's Block Device Mapping. "
  type        = list(any)
}
variable "ebs_block_device" {
  description = "ebs block device attributes control a portion of the AWS Instance's Block Device Mapping. "
  type        = list(any)
}
variable "ephemeral_block_device" {
  description = "ephemeral block device attributes control a portion of the AWS Instance's Block Device Mapping. "
  type        = list(any)
}
