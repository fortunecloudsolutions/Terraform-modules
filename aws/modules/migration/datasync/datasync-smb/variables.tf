variable "agent_arns" {
  type        = list(string)
  description = "(Required) A list of DataSync Agent ARNs with which this location will be associated."
}

variable "domain" {
  type        = string
  description = "(Optional) The name of the Windows domain the SMB server belongs to."
}

variable "mount_options" {
  type = object({
    version = string # (Optional) The specific SMB version that you want DataSync to use for mounting your SMB share. Valid values: AUTOMATIC, SMB2, and SMB3. Default: AUTOMATIC
  })
  description = "(Optional) Configuration block containing mount options used by DataSync to access the SMB Server. Can be AUTOMATIC, SMB2, or SMB3."
  default     = null
}

variable "password" {
  type        = string
  description = "(Required) The password of the user who can mount the share and has file permissions in the SMB."
}

variable "server_hostname" {
  type        = string
  description = "(Required) Specifies the IP address or DNS name of the SMB server. The DataSync Agent(s) use this to mount the SMB share."
}

variable "subdirectory" {
  type        = string
  description = "(Required) Subdirectory to perform actions as source or destination. Should be exported by the NFS server."
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location."
  default     = {}
}

variable "user" {
  type        = string
  description = "(Required) The user who can mount the share and has file and folder permissions in the SMB share."
}