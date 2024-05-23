
variable "vpc_id" {
  description = "(Required) The ID of the VPC to which we would like to associate a DHCP Options Set."
  type        = string
}

variable "dhcp_options_id" {
  description = "(Required) The ID of the DHCP Options Set to associate to the VPC."
  type        = string
}
