variable "name" {
  type        = string
  description = "(Required) The name of the Redshift security group."
}

variable "description" {
  type        = string
  description = "(Optional) The description of the Redshift security group. Defaults to Managed by Terraform."
  default     = null
}

variable "ingress" {
  description = "(Optional) A list of ingress rules."

  type = list(object({
    cidr                    = string #The CIDR block to accept
    security_group_name     = string # The name of the security group to authorize
    security_group_owner_id = string #The owner Id of the security group provided by security_group_name.

  }))

  default = null
}