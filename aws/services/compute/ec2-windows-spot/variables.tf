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

variable "ami" {
  description = "The AMI to use for the instance."
  type        = string
}

# variable "os_map" {
#   description = "Map of different OS to AMI"
#   type        = map
# default : {
#   "windowsserver2019"                      : "ami-0db6a09e9ade44bb3"
#   "windowsserver2019withsqlserver2017ee"   : "ami-0e707a501accd950a"
#   "windowsserver2016"                      : "ami-05785493aafc97b8b"
#   "windowsserver2016withsqlserver2017ee"   : "ami-0e44f18df8bfef8cf"
#   "windowsserver2012R2"                    : "ami-0b50cc81076956cee"
#   "windowsserver2012R2withsqlserver2016se" : "ami-0349e92256f8a2597"
#   "windowsserver2012R2withsqlserver2016ee" : "ami-09f31e2aed7f303a7"
#   "windowsserver2019withsqlserver2017se"   : "ami-00523cb8330ff4eae"
#   "windowsserver2019withsqlserver2019se"   : "ami-0ef6b4c0b70f165bc"
#   "windowsserver2016withsqlserver2016se"   : "ami-01619db5dd0907902"
#   "windowsserver2016withsqlserver2017se"   : "ami-063d7f3076158ffdb"
#   "windowsserver2016withsqlserver2019se"   : "ami-080deeb4be2e0e348"
#   "windowsserver2019withsqlserver2019ee"   : "ami-085d7cd05336c0ada"
#   "windowsserver2016withsqlserver2016ee"   : "ami-022bbda343c62c9d0"
#   "windowsserver2016withsqlserver2019ee"   : "ami-024a2b34784d67e34"
#   "amazonlinux2"                           : "ami-07c8bc5c1ce9598c3"
#   "RHEL8"                                  : "ami-0a54aef4ef3b5f881"
#   "SUSELinux"                              : "ami-03f4c416f489586a3"
#   "Ubuntu18.04"                            : "ami-0bbe28eb2173f6167"
#   "centos"                                 : "ami-01e36b7901e884a10"
#   "DebianMySQL8.0"                         : "ami-001aa93d734693aac"
# }
# }


variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "key_name" {
  description = "(Required) The key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
  type        = string
}

variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value."
  type        = bool
  default     = null
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information."
  type        = bool
  default     = null

}

variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)"
  type        = bool
  default     = null

}

variable "availability_zone" {
  description = "(Optional) The AZ to start the instance in."
  type        = string
  default     = null

}

variable "subnet_id" {
  description = "(Optional) The VPC Subnet ID to launch in."
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "(Optional, VPC only) A list of security group IDs to associate with."
  type        = list(any)
  default     = []
}

variable "instance_type" {
  description = "(Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
  type        = string
}

variable "root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance. See Block Devices below for details."
  type        = list(any)
  default     = []
}

variable "ebs_block_device" {
  description = " (Optional) Additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation. See Block Devices below for details on attributes and drift detection."
  type        = list(any)
  default     = []
}

variable "ephemeral_block_device" {
  description = "(Optional) Customize Ephemeral (also known as 'Instance Store') volumes on the instance."
  type        = list(any)
  default     = []
}

variable "get_password_data" {
  description = "If true, wait for password data to become available and retrieve it. "
  type        = bool
  default     = true
}

variable "pem_key" {
  description = "The decoded pem key as input"
  type        = string
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

variable "user_data" {
  description = "(Optional) User data to provide when launching the instance. Do not pass gzip-compressed data via this argument"
  type        = string
  default     = null
}


