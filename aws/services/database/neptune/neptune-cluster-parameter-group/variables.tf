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
  type        = string
  description = "(Optional, Forces new resource) The name of the neptune cluster parameter group. If omitted, Terraform will assign a random, unique name."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
  default     = null
}

variable "family" {
  type        = string
  description = "(Required) The family of the neptune cluster parameter group."
}

variable "description" {
  type        = string
  description = "(Optional) The description of the neptune cluster parameter group. Defaults to Managed by Terraform."
  default     = "Managed by Terraform"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "parameter" {
  description = "(Optional) A list of neptune parameters to apply."

  type = list(object({
    name         = string #(Required) The name of the neptune parameter.
    value        = number #(Required) The value of the neptune parameter.
    apply_method = string #(Optional) Valid values are immediate and pending-reboot. Defaults to pending-reboot.
  }))

  default = null
}
