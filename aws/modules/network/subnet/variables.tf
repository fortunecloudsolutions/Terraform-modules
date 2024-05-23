
variable "cidr_subnet" {
  description = "The CIDR block for the subnet."
  type        = string
  # default = "11.0.0.0/24"
}
variable "availability_zone" {
  description = " The AZ for the subnet."
  type        = string
  # default = "us-east-2c"
}
variable "vpc_id" {
  description = "The VPC ID."
  type        = string
  # default = "vpc-0c08a93dbf186f8c1" 
}
variable "map_publicip" {
  description = " Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
  type        = bool
  default     = "false"
}
variable "ipv6_cidr_block" {
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length."
  type        = string
  default     = null
}
variable "outpost_arn" {
  description = "The Amazon Resource Name (ARN) of the Outpost."
  type        = string
  default     = null
}
variable "assign_ipv6_address_on_creation" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
  type        = bool
  default     = false
}
variable "tags" {
  description = "Map of tag key and value pairs"
  type        = map(any)
}