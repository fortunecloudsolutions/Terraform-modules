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

#efs
variable "performance_mode" {
  description = "The file system performance mode. Can be either 'generalPurpose' or 'maxIO' (Default: 'generalPurpose')."
  type        = string
}

variable "provisioned_throughput_in_mibps" {
  description = "The throughput, measured in MiB/s, that you want to provision for the file system"
  type        = number
}

variable "throughput_mode" {
  description = " Throughput mode for the file system. Defaults to bursting. Valid values: bursting, provisioned. When using provisioned, also set provisioned_throughput_in_mibps."
  type        = string
}

variable "transition_to_ia" {
  description = " Indicates how long it takes to transition files to the IA storage class"
  type        = string
}

variable "creation_token" {
  description = "Names for the tags"
  type        = string
}

variable "encrypted" {
  description = "If true, the disk will be encrypted"
  type        = bool
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true"
  type        = string
  default     = null
}

variable "tags" {
  description = "Names for the tags"
  type        = map(any)
  default     = {}
}
