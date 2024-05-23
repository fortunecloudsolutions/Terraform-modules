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
# security group

variable "vpc_id" {
  description = "The ID of the associated VPC."
  type        = string

}
variable "subnet_ids" {
  description = " A list of Subnet IDs to apply the ACL to"
  type        = list(any)

}
variable "nacl_name" {
  description = "name of the nacl"
  type        = string
}

variable "ingress1_rule_no" {
  description = "The rule number. Used for ordering."
  type        = number

}
variable "ingress1_fport" {
  description = "The from port to match."
  type        = number

}
variable "ingress1_tport" {
  description = "The to port to match."
  type        = number

}
variable "ingress1_protocol" {
  description = "The protocol to match."
  type        = string

}
variable "ingress1_cidr" {
  description = "The CIDR block to match. This must be a valid network mask."
  type        = string

}
variable "ingress1_ipv6_cidr" {
  description = " The IPv6 CIDR block."
  type        = string
  default     = null
}
variable "ingress1_action" {
  description = " The action to take."
  type        = string

}


variable "egress1_rule_no" {
  description = "The rule number. Used for ordering."
  type        = number

}
variable "egress1_fport" {
  description = "The from port to match."
  type        = number

}
variable "egress1_tport" {
  description = "The to port to match."
  type        = number

}
variable "egress1_protocol" {
  description = "The protocol to match."
  type        = string
  #default = "tcp"
}
variable "egress1_cidr" {
  description = "The CIDR block to match. This must be a valid network mask."
  type        = string

}
variable "egress1_ipv6_cidr" {
  description = " The IPv6 CIDR block."
  type        = string
  default     = null
}
variable "egress1_action" {
  description = " The action to take."
  type        = string

}
variable "tags" {
  description = " A map of tags to assign to the resource."
  type        = map(any)
  default     = {}
}