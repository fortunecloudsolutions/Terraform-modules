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

variable "spot_price" {
  description = "(Optional; Default: On-demand price) The maximum price to request on the spot market."
  type        = string
  default     = null
}

variable "wait_for_fulfillment" {
  description = "(Optional; Default: false) If set, Terraform will wait for the Spot Request to be fulfilled, and will throw an error if the timeout of 10m is reached."
  type        = bool
  default     = false
}

variable "spot_type" {
  description = "(Optional; Default: persistent) If set to one-time, after the instance is terminated, the spot request will be closed."
  type        = string
  default     = "persistent"
}

variable "launch_group" {
  description = "(Optional) A launch group is a group of spot instances that launch together and terminate together. If left empty instances are launched and terminated individually."
  type        = string
  default     = null
}

variable "block_duration_minutes" {
  description = "(Optional) The required duration for the Spot instances, in minutes. This value must be a multiple of 60 (60, 120, 180, 240, 300, or 360). The duration period starts as soon as your Spot instance receives its instance ID. At the end of the duration period, Amazon EC2 marks the Spot instance for termination and provides a Spot instance termination notice, which gives the instance a two-minute warning before it terminates. Note that you can't specify an Availability Zone group or a launch group if you specify a duration."
  type        = string
  default     = null
}

variable "instance_interruption_behaviour" {
  description = "(Optional) Indicates whether a Spot instance stops or terminates when it is interrupted. Default is terminate as this is the current AWS behaviour."
  type        = string
  default     = "terminate"
}

variable "valid_until" {
  description = "(Optional) The end date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ). At this point, no new Spot instance requests are placed or enabled to fulfill the request. The default end date is 7 days from the current date."
  type        = string
  default     = null
}

variable "valid_from" {
  description = "(Optional) The start date and time of the request, in UTC RFC3339 format(for example, YYYY-MM-DDTHH:MM:SSZ). The default is to start fulfilling the request immediately."
  type        = string
  default     = null
}

variable "timeouts" {
  description = "The timeouts block allows you to specify timeouts for certain actions:"
  type = object({
    create = string
    delete = string
  })
}