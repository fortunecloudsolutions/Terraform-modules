variable "subnet_id" {
  description = "Subnet ID to create the ENI in"
  type        = string
  default     = null
}

variable "description" {
  description = "A description for the network interface"
  type        = string
  default     = null
}

variable "private_ips" {
  description = "List of private IPs to assign to the ENI"
  type        = list(any)
}

variable "private_ips_count" {
  description = "Number of secondary private IPs to assign to the ENI. The total number of private IPs will be 1 + private_ips_count, as a primary private IP will be assiged to an ENI by default."
  type        = number
  default     = null
}

variable "security_groups" {
  description = " List of security group IDs to assign to the ENI."
  type        = string
  default     = null
}

variable "attachment" {
  description = "Block to define the attachment of the ENI. Documented below."
  type        = string
  default     = null
}

variable "source_dest_check" {
  description = "Whether to enable source destination checking for the ENI. Default true."
  type        = string
  default     = null
}
