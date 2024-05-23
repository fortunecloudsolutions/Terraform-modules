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
variable "nacl_id" {
  description = "The ID of the network ACL."
  type        = string

}
variable "egress_enable" {
  description = "Indicates whether this is an egress rule (rule is applied to traffic leaving the subnet). Default false."
  type        = bool
  default     = false

}
variable "rule_no" {
  description = "The rule number for the entry (for example, 100). ACL entries are processed in ascending order by rule number"
  type        = number

}
variable "fport" {
  description = "The from port to match."
  type        = number

}
variable "tport" {
  description = " The to port to match."
  type        = number

}
variable "protocol" {
  description = " The protocol. A value of -1 means all protocols."
  type        = string

}
variable "cidr" {
  description = "The network range to allow or deny, in CIDR notation (for example 172.16.0.0/24 )."
  type        = string
}
variable "ipv6_cidr" {
  description = "The IPv6 CIDR block to allow or deny."
  type        = string
  default     = "null"
}
variable "action" {
  description = "Indicates whether to allow or deny the traffic that matches the rule. Accepted values: allow | deny"
  type        = string

}

