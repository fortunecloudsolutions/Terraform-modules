variable "name" {
  type        = string
  description = "(Required) The name of the Redshift parameter group."
}

variable "family" {
  type        = string
  description = "(Required) The family of the Redshift parameter group."

}

variable "description" {
  type        = string
  description = "(Optional) The description of the Redshift parameter group. Defaults to Managed by Terraform."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  default     = {}
}

variable "parameter" {
  description = "(Optional) A list of Redshift parameters to apply."

  type = list(object({
    name  = string #(Required) The name of the Redshift parameter.
    value = number #(Required) The value of the Redshift parameter.

  }))

  default = null
}
