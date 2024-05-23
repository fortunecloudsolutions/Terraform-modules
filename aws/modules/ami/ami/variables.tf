variable "name" {
  description = "(Required) Region-unique name for the AMI."
  type        = string

}

variable "boot_mode" {
  description = "(Optional) Boot mode of the AMI"
  type        = string
  default     = null
}

variable "deprecation_time" {
  description = "(Optional) Date and time to deprecate the AMI."
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) Longer, human-readable description for the AMI."
  type        = string
  default     = null
}

variable "ena_support" {
  description = "(Optional) Whether enhanced networking with ENA is enabled. Defaults to false."
  type        = string
  default     = null
}


variable "root_device_name" {
  description = "- (Optional) Name of the root device (for example, /dev/sda1, or /dev/xvda)."
  type        = string
  default     = null
}


variable "virtualization_type" {
  description = "(Optional) Keyword to choose what virtualization mode created instances will use. Can be either paravirtual (the default) or hvm."
  type        = string
  default     = null
}

variable "architecture" {
  description = " (Optional) Machine architecture for created instances. Defaults to x86_64."
  type        = string
  default     = null
}

variable "tpm_support" {
  description = "(Optional) If the image is configured for NitroTPM support, the value is v2.0."
  type        = string
  default     = null
}

variable "imds_support" {
  description = "(Optional) If EC2 instances started from this image should require the use of the Instance Metadata Service V2 (IMDSv2), set this argument to v2.0"
  type        = string
  default     = null
}


variable "ebs_block_device" {
  description = "   (Optional) Configuration block to define the attachment of the ENI."
  type = object({
    device_name = string #  (Required) Path at which the device is exposed to created instances.
    snapshot_id = string # (Optional) ID of an EBS snapshot that will be used to initialize the created EBS volumes. 
    volume_size = string # Required unless snapshot_id is set) Size of created volumes in GiB.
  })

}




