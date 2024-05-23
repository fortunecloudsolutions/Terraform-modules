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

variable "name" {
  description = "(Required) A region-unique name for the AMI."
  type        = string
}

variable "source_instance_id" {
  description = "(Required) The id of the instance to use as the basis of the AMI."
  type        = string
}

variable "snapshot_without_reboot" {
  description = " (Optional) Boolean that overrides the behavior of stopping the instance before snapshotting. This is risky since it may cause a snapshot of an inconsistent filesystem state, but can be used to avoid downtime if the user otherwise guarantees that no filesystem writes will be underway at the time of snapshot."
  type        = string
  default     = false
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

variable "timeouts" {
  description = "aws_db_instance provides the following Timeouts configuration options"
  type = object({
    create = string
    update = string
    delete = string
  })
  default = { "create" : "60m", "update" : "60m", "delete" : "60m" }
}
