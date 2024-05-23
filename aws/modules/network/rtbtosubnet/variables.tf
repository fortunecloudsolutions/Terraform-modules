
variable "subnet_id" {
  description = "The subnet ID to create an association."
  type        = list(any)
}
variable "rtb_id" {
  description = "The ID of the routing table to associate with."
  type        = string
}

