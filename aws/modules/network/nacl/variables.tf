
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
  #default = "Cnetnacl"
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
  default     = null #[]
}
variable "ingress1_action" {
  description = " The action to take."
  type        = string

}
variable "ingress1_icmp_type" {
  description = "The ICMP type to be used. Default 0."
  type        = number
  default     = 0
}
variable "ingress1_icmp_code" {
  description = "The ICMP type code to be used. Default 0."
  type        = number
  default     = 0
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
  default     = null #[]
}
variable "egress1_action" {
  description = " The action to take."
  type        = string

}
variable "egress1_icmp_type" {
  description = "The ICMP type to be used. Default 0."
  type        = number
  default     = 0
}
variable "egress1_icmp_code" {
  description = "The ICMP type code to be used. Default 0."
  type        = number
  default     = 0
}

variable "tags" {
  description = " A map of tags to assign to the resource."
  type        = map(any)

}