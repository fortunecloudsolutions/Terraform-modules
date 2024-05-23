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

variable "fsx_filesystem_arn" {
  type        = string
  description = "(Required) The Amazon Resource Name (ARN) for the FSx for Windows file system."
}

variable "user" {
  type        = string
  description = "(Required) The user who has the permissions to access files and folders in the FSx for Windows file system."
}

variable "password" {
  type        = string
  description = "(Required) The password of the user who has the permissions to access files and folders in the FSx for Windows file system."
}

variable "domain" {
  type        = string
  description = "(Optional) The name of the Windows domain that the FSx for Windows server belongs to."
  default     = null
}

variable "subdirectory" {
  type        = string
  description = "(Optional) Subdirectory to perform actions as source or destination"
  default     = null
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location."
  default     = {}
}

variable "security_group_arns" {
  type        = list(string)
  description = "(Required) The Amazon Resource Names (ARNs) of the security groups that are to use to configure the FSx for Windows file system."
}