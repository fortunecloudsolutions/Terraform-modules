variable "name" {
  description = " (Required) Region-unique name for the AMI."
  type        = string

}

variable "source_ami_id" {
  description = "(Required) Id of the AMI to copy."
  type        = string
}

variable "source_ami_region" {
  description = "(Required) Region from which the AMI will be copied."
  type        = string
}

variable "description" {
  description = "(Optional) Longer, human-readable description for the AMI."
  type        = string
  default     = null
}

variable "encrypted" {
  description = "(Optional) Whether the destination snapshots of the copied image should be encrypted."
  type        = string
  default     = null
}


variable "kms_key_id" {
  description = "- (Optional) Full ARN of the KMS Key to use when encrypting the snapshots of an image during a copy operation."
  type        = string
  default     = null
}

variable "destination_outpost_arn" {
  description = "- (Optional) ARN of the Outpost to which to copy the AMI."
  type        = string
  default     = null
}
