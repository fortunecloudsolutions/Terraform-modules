
variable "cidr_vpc" {
  description = "The CIDR block for the VPC."
  type        = string

}
variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC. Defaults true."
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false."
  type        = bool
  default     = false
}
variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host."
  type        = string
  default     = "default"
}
variable "tags" {
  description = "A map of tags to assign to the resource vpc."
  type        = map(any)

}



