variable "vpc_peering_connection_id" {
  description = "(Required) The ID of the requester VPC peering connection."
  type        = string
}

variable "auto_accept" {
  description = "(Optional) Accept the peering (both VPCs need to be in the same AWS account)."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}