
variable "name" {
  description = "Creates a unique name beginning with the specified prefix. "
  type        = string
  default     = null

}
variable "image_id" {
  description = "The EC2 image ID to launch."
  type        = string

}
variable "cluster_instance_type" {
  description = "The size of instance to launch."
  type        = string

}
variable "key_name" {
  description = "The key name that should be used for the instance."
  type        = string

}
variable "instance_profile" {
  description = "The name attribute of the IAM instance profile to associate with launched instances."
  type        = string

}
variable "user_data" {
  description = " The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument"
  type        = string
  default     = null
}
variable "security_group" {
  description = " A list of associated security group IDS"
  type        = list(string)

}
variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC."
  type        = string

}
variable "volume_size" {
  description = "The size of the volume in gigabytes."
  default     = null

}
variable "volume_type" {
  description = "The type of volume. Can be standard, gp2, or io1. (Default: standard)."
  default     = null

}
variable "iops" {
  description = "The amount of provisioned IOPS. This must be set with a volume_type of io1."
  default     = null

}
variable "delete_on_termination" {
  description = "Whether the volume should be destroyed on instance termination"
  default     = true

}
variable "encrypted" {
  description = "Whether the volume should be encrypted or not."
  default     = false

}

variable "vpc_classic_link_id" {
  description = "The ID of a ClassicLink-enabled VPC. Only applies to EC2-Classic instances."
  default     = null
}
variable "vpc_classic_link_security_groups" {
  description = "The IDs of one or more security groups for the specified ClassicLink-enabled VPC "
  default     = null
}
variable "enable_monitoring" {
  description = "Enables/disables detailed monitoring. This is enabled by default."
  default     = null

}
variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized."
  default     = null
}

variable "spot_price" {
  description = "The maximum price to use for reserving spot instances."
  default     = null
}
variable "placement_tenancy" {
  description = "The tenancy of the instance. Valid values are default or dedicated"
  default     = null
}