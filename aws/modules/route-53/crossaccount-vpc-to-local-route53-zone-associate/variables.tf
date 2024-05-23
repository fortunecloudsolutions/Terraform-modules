variable "zone_id" {
  type        = string
  description = "The ID of the private hosted zone that you want to authorize associating a VPC with."
}

variable "vpc_id" {
  type        = string
  description = "The VPC to authorize for association with the private hosted zone."
}

variable "vpc_region" {
  type        = string
  description = "The VPC's region. Defaults to the region of the AWS provider."
}

# variable "peer_provider_alias" {
#   type        = string
#   description = "The alternate aws account alias reference. Refer - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_vpc_association_authorization"
# }