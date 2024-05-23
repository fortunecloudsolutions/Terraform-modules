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
  description = "(Optional, Forces new resource) The name of the DB parameter group. If omitted, Terraform will assign a random, unique name."
  type        = string
  default     = null
}

variable "family" {
  description = "(Required, Forces new resource) The family of the DB parameter group."
  type        = string
}

variable "parameters" {
  description = " (Optional) A list of DB parameters to apply. Note that parameters may differ from a family to an other. Full list of all parameters can be discovered via aws rds describe-db-parameters after initial creation of the group."
  type = list(object({
    name         = string # (Required) The name of the DB parameter.
    value        = string # (Required) The value of the DB parameter. 
    apply_method = string # (Optional) "immediate" (default), or "pending-reboot". Some engines can't apply some parameters without a reboot, and you will need to specify "pending-reboot" here.
  }))
  default = []
}

variable "description" {
  description = "(Optional, Forces new resource) The description of the DB parameter group. Defaults to 'Managed by Terraform'."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}