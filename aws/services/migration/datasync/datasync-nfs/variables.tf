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

variable "server_hostname" {
  type        = string
  description = "(Required) Specifies the IP address or DNS name of the NFS server. The DataSync Agent(s) use this to mount the NFS server."
}

variable "subdirectory" {
  type        = string
  description = "(Required) Subdirectory to perform actions as source or destination. Should be exported by the NFS server."
}

variable "on_prem_config" {
  type = object({
    agent_arns = list(string) # (Required) List of Amazon Resource Names (ARNs) of the DataSync Agents used to connect to the NFS server.
  })
  description = "(Required) Configuration block containing information for connecting to the NFS File System."
}

variable "tags" {
  type        = map(any)
  description = "(Optional) Key-value pairs of resource tags to assign to the DataSync Location."
  default     = {}
}

variable "mount_options" {
  type = object({
    mount_options_version = string # (Optional) The specific NFS version that you want DataSync to use for mounting your NFS share. Valid values: AUTOMATIC, NFS3, NFS4_0 and NFS4_1. Default: AUTOMATIC
  })
  description = "(Optional) Configuration block containing mount options used by DataSync to access the NFS Server."
  default     = null
}