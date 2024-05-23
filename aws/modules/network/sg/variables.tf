variable "vpc_id" {
  description = " The VPC ID."
  type        = string

}
variable "sg_name" {
  description = "The name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string

}
variable "sg_text" {
  description = " The security group description."
  type        = string
}
variable "ingress1_desc" {
  description = " Description of this ingress rule."
  type        = string

}
variable "ingress1_fport" {
  description = "The start port (or ICMP type number if protocol is icmp or icmpv6)"
  type        = number

}
variable "ingress1_tport" {
  description = "The end range port (or ICMP code if protocol is icmp)."
  type        = number

}
variable "ingress1_protocol" {
  description = " The protocol. "
  type        = string
  default     = "tcp"
}
variable "ingress1_cidr" {
  description = " List of CIDR blocks."
  type        = list(any)
}
variable "ingress1_ipv6_cidr" {
  description = "List of IPv6 CIDR blocks."
  type        = list(any)
  default     = []
}
variable "ingress1_prefix_ids" {
  description = "List of prefix list IDs."
  type        = list(any)
  default     = []
}
variable "ingress1_security_groups" {
  description = "List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC."
  type        = list(any)
  default     = []
}
variable "egress1_desc" {
  description = " Description of this egress rule."
  type        = string

}
variable "egress1_fport" {
  description = "The start port (or ICMP type number if protocol is icmp or icmpv6)"
  type        = number

}
variable "egress1_tport" {
  description = "The end range port (or ICMP code if protocol is icmp)."
  type        = number

}
variable "egress1_protocol" {
  description = " The protocol. "
  type        = string

}
variable "egress1_cidr" {
  description = " List of CIDR blocks."
  type        = list(any)

}
variable "egress1_ipv6_cidr" {
  description = "List of IPv6 CIDR blocks."
  type        = list(any)
  default     = []
}
variable "egress1_prefix_ids" {
  description = "List of prefix list IDs."
  type        = list(any)
  default     = []
}
variable "egress1_security_groups" {
  description = "List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC."
  type        = list(any)
  default     = []
}
