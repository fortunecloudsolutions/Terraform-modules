variable "region" {
  description = "The AWS region for API calls."
  type        = string
}

variable "vault_addr" {
  description = "The Vault URL to which vault sends and requests data"
  type        = string
}
variable "vault_token" {
  description = "The vault token, used for authorization"
  type        = string
}

variable "max_lease_seconds" {
  description = "Specifies the maximum time-to-live. If set, this overrides the global default. Must be a valid duration string"
  type        = string
}

variable "backend" {
  description = "Backend is the provider"
  type        = string
}
variable "role" {
  description = "Role is usually resources"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to create the ENI in"
  type        = string

}

variable "description" {
  description = "A description for the network interface"
  type        = string
  default     = null
}

variable "private_ip_list" {
  description = "(Optional) List of private IPs to assign to the ENI in sequential order."
  type        = list(any)
}

variable "private_ip_list_enabled" {
  description = "(Optional) Whether private_ip_list is allowed and controls the IPs to assign to the ENI and private_ips and private_ips_count become read-only. Default false."
  type        = number
  default     = null
}

variable "security_groups" {
  description = " List of security group IDs to assign to the ENI."
  type        = list(any)
  default     = null
}


variable "source_dest_check" {
  description = "Whether to enable source destination checking for the ENI. Default true."
  type        = string
  default     = null
}


variable "interface_type" {
  description = "(Optional) Type of network interface to create. Set to efa for Elastic Fabric Adapter."
  type        = string
  default     = null
}

variable "ipv4_prefix_count" {
  description = "Whether to enable source destination checking for the ENI. Default true."
  type        = string
  default     = null
}

variable "ipv4_prefixes" {
  description = "(Optional) One or more IPv4 prefixes assigned to the network interface."
  type        = string
  default     = null
}

variable "private_ips_count" {
  description = "Whether to enable source destination checking for the ENI. Default true."
  type        = string
  default     = null
}


variable "attachment" {
  description = "   (Optional) Configuration block to define the attachment of the ENI."
  type = object({
    instance     = string #  (Required) ID of the instance to attach to.
    device_index = string # (Required) Integer to define the devices index.
  })

}




