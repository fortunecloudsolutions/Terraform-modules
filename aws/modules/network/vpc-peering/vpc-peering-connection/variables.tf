variable "peer_owner_id" {
  description = "(Optional) The AWS account ID of the owner of the peer VPC. Defaults to the account ID the AWS provider is currently connected to."
  type        = string
  default     = null
}

variable "peer_vpc_id" {
  description = "(Required) The ID of the VPC with which you are creating the VPC Peering Connection."
  type        = string
}

variable "vpc_id" {
  description = "(Required) The ID of the requester VPC."
  type        = string
}

variable "auto_accept" {
  description = "(Optional) Accept the peering (both VPCs need to be in the same AWS account)."
  type        = bool
  default     = false
}

variable "peer_region" {
  description = "(Optional) The region of the accepter VPC of the [VPC Peering Connection]. auto_accept must be false, and use the aws_vpc_peering_connection_accepter to manage the accepter side."
  type        = string
  default     = null
}

variable "accepter" {
  description = "(Optional) - An optional configuration block that allows for [VPC Peering Connection] (https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) options to be set for the VPC that accepts the peering connection (a maximum of one)."
  type = object({
    allow_remote_vpc_dns_resolution  = bool # (Optional) Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC. This is not supported for inter-region VPC peering.
    allow_classic_link_to_remote_vpc = bool # (Optional) Allow a local linked EC2-Classic instance to communicate with instances in a peer VPC. This enables an outbound communication from the local ClassicLink connection to the remote VPC.
    allow_vpc_to_remote_classic_link = bool # (Optional) Allow a local VPC to communicate with a linked EC2-Classic instance in a peer VPC. This enables an outbound communication from the local VPC to the remote ClassicLink connection.
  })
  default = null
}

variable "requester" {
  description = "(Optional) - An optional configuration block that allows for [VPC Peering Connection] (https://docs.aws.amazon.com/vpc/latest/peering/what-is-vpc-peering.html) options to be set for the VPC that accepts the peering connection (a maximum of one)."
  type = object({
    allow_remote_vpc_dns_resolution  = bool # (Optional) Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC. This is not supported for inter-region VPC peering.
    allow_classic_link_to_remote_vpc = bool # (Optional) Allow a local linked EC2-Classic instance to communicate with instances in a peer VPC. This enables an outbound communication from the local ClassicLink connection to the remote VPC.
    allow_vpc_to_remote_classic_link = bool # (Optional) Allow a local VPC to communicate with a linked EC2-Classic instance in a peer VPC. This enables an outbound communication from the local VPC to the remote ClassicLink connection.
  })
  default = null
}

variable "timeouts" {
  description = "aws_vpc_peering_connection provides the following Timeouts configuration options:"
  type = object({
    create = string
    update = string
    delete = string
  })
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}