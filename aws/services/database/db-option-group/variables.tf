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
  description = " (Optional, Forces new resource) The name of the option group. If omitted, Terraform will assign a random, unique name. Must be lowercase, to match as it is stored in AWS."
  type        = string
  default     = null
}
variable "option_group_description" {
  description = " (Optional) The description of the option group. Defaults to 'Managed by Terraform'."
  type        = string
  default     = null
}
variable "engine_name" {
  description = " (Required) Specifies the name of the engine that this option group should be associated with"
  type        = string

}
variable "major_engine_version" {
  description = "  (Required) Specifies the major version of the engine that this option group should be associated with."
  type        = string
}

variable "options" {
  description = "(Optional) A list of Options to apply."
  type = list(object({
    option_name = string
    option_settings = list(object({
      name   = string # (Optional) The Name of the setting.
      string = string # (Optional) The Value of the setting.
    }))
    port                           = number       # (Optional) The Port number when connecting to the Option (e.g. 11211).
    version                        = string       # (Optional) The version of the option (e.g. 13.1.0.0).
    db_security_group_memberships  = list(string) # (Optional) A list of DB Security Groups for which the option is enabled.
    vpc_security_group_memberships = list(string) # (Optional) A list of VPC Security Groups for which the option is enabled.
  }))
  default = null
}

variable "timeouts" {
  description = "Define maximum timeout for deletion of `aws_db_option_group` resource"
  type        = map(string)
  default = {
    delete = "15m"
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}


