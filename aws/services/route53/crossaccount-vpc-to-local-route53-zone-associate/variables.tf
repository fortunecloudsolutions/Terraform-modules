variable "region" {
  description = "aws region"
  type        = string
}

variable "vault_addr" {
  description = "vault address"
  type        = string
}

variable "vault_token" {
  description = "vault token"
  type        = string
}

variable "lease_seconds" {
  description = "The default TTL for credentials issued by this backend."
  type        = string
}

variable "backend" {
  description = "The path the AWS secret backend is mounted at, with no leading or trailing /s."
  type        = string
}

variable "role" {
  description = "The name to identify this role within the backend. Must be unique within the backend."
  type        = string

}

variable "access_key_alternate_account" {
  description = "The access key for the alternate account where the VPC resides"
  type        = string
}

variable "secret_key_alternate_account" {
  description = "The secret key for the alternate account where the VPC resides"
  type        = string

}

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