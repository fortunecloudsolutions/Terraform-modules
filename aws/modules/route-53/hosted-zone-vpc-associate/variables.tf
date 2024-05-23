variable "zone_id" {
  type        = string
  description = "The private hosted zone to associate."
}

variable "vpc_id" {
  type        = string
  description = "The VPC to associate with the private hosted zone."
}

variable "vpc_region" {
  type        = string
  description = "The VPC's region. Defaults to the region of the AWS provider."
}