variable "instance_id" {
  description = "The ID of the instance. This is required for EC2-Classic. For EC2-VPC, you can specify either the instance ID or the network interface ID, but not both. The operation fails if you specify an instance ID unless exactly one network interface is attached."
  type        = string
}

variable "eip_allocation_id" {
  description = " The allocation ID. This is required for EC2-VPC"
  type        = string
  default     = null
}

variable "allow_reassociation" {
  description = "Whether to allow an Elastic IP to be re-associated. Defaults to true in VPC"
  type        = string
  default     = null
}

variable "network_interface_id" {
  description = " The ID of the network interface. If the instance has more than one network interface, you must specify a network interface ID"
  type        = string
  default     = null
}

variable "private_ip_address" {
  description = " The primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address"
  type        = string
  default     = null
}