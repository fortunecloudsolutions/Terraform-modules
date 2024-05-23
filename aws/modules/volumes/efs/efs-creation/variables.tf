#aws_efs_file_system

variable "creation_token" {
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation."
  type        = string
}
variable "encrypted" {
  description = "If true, the disk will be encrypted"
  type        = bool
  default     = null
}
variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true"
  type        = string
  default     = null
}

variable "performance_mode" {
  description = "The file system performance mode. Can be either"
  type        = string
}
variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system"
  type        = number
}
variable "throughput_mode" {
  description = "Throughput mode for the file system"
  type        = string
  default     = null
}

variable "transition_to_ia" {
  description = " Indicates how long it takes to transition files to the IA storage class"
  type        = string
}
variable "tags" {
  description = "A map of tags to assign to the file system."
  type        = map(any)
}
