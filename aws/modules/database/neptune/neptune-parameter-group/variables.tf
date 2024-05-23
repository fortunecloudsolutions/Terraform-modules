variable "name" {
  type        = string
  description = "(Required, Forces new resource) The name of the Neptune parameter group."
}

variable "family" {
  type        = string
  description = "(Required) The family of the Neptune parameter group."
}

variable "description" {
  type        = string
  description = "(Optional) The description of the Neptune parameter group. Defaults to Managed by Terraform."
  default     = "Managed by Terraform"
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "parameter" {
  description = "(Optional) A list of Neptune parameters to apply."

  type = list(object({
    name         = string #(Required) The name of the Neptune parameter.
    value        = number #(Required) The value of the neptune parameter.
    apply_method = string #(Optional) The apply method of the Neptune parameter. Valid values are immediate and pending-reboot. Defaults to pending-reboot.
  }))

  default = null
}
