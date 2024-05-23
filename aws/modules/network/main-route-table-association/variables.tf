
variable "route_table_id" {
  description = "(Required) The ID of the Route Table to set as the new main route table for the target VPC."
  type        = string

}

variable "vpc_id" {
  description = "(Required) The ID of the VPC whose main route table should be set"
  type        = string


}

