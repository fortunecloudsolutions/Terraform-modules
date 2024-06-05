variable "aws_perimeter_access_key_id" {
  description = "AWS Access Key ID for Perimeter Account"
}

variable "aws_perimeter_secret_access_key" {
  description = "AWS Secret Access Key for Perimeter Account"
}

variable "aws_centralhub_access_key_id" {
  description = "AWS Access Key ID for CentralHub Account"
}

variable "aws_centralhub_secret_access_key" {
  description = "AWS Secret Access Key for CentralHub Account"
}

variable "aws_production_access_key_id" {
  description = "AWS Access Key ID for Production Account"
}

variable "aws_production_secret_access_key" {
  description = "AWS Secret Access Key for Production Account"
}

variable "aws_performance_access_key_id" {
  description = "AWS Access Key ID for Performance Account"
}

variable "aws_performance_secret_access_key" {
  description = "AWS Secret Access Key for Performance Account"
}

variable "aws_development_access_key_id" {
  description = "AWS Access Key ID for Development Account"
}

variable "aws_development_secret_access_key" {
  description = "AWS Secret Access Key for Development Account"
}

variable "aws_region_perimeter" {
  description = "AWS Region for Perimeter Account"
  type        = string
  default     = "us-west-2"
}

variable "aws_region_centralhub" {
  description = "AWS Region for CentralHub Account"
  type        = string
  default     = "us-west-2"
}

variable "aws_region_production" {
  description = "AWS Region for Production Account"
  type        = string
  default     = "us-west-2"
}

variable "aws_region_production_east" {
  description = "AWS Region for Production East Account"
  type        = string
  default     = "us-east-1"
}

variable "aws_region_performance" {
  description = "AWS Region for Performance Account"
  type        = string
  default     = "us-west-2"
}

variable "aws_region_development" {
  description = "AWS Region for Development Account"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr_blocks" {
  type = map(map(string))
  default = {
    perimeter = {
      vpc1 = "10.0.0.0/16"
      vpc2 = "10.1.0.0/16"
    }
    centralhub = {
      vpc1 = "10.2.0.0/16"
    }
  }
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "gateway_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "transit_gateway_description" {
  description = "Description for Transit Gateway"
  type        = string
}

variable "auto_accept_shared_attachments" {
  description = "Auto-accept shared attachments"
  type        = string
}

variable "default_route_table_association" {
  description = "Default route table association"
  type        = string
}

variable "default_route_table_propagation" {
  description = "Default route table propagation"
  type        = string
}

variable "dns_support" {
  description = "DNS support for Transit Gateway"
  type        = string
}

variable "multicast_support" {
  description = "Multicast support for Transit Gateway"
  type        = string
}

variable "vpn_ecmp_support" {
  description = "VPN ECMP support for Transit Gateway"
  type        = string
}

variable "transit_gateway_name" {
  description = "Name for Transit Gateway"
  type        = string
}

variable "ram_resource_share_name" {
  description = "Name for RAM resource share"
  type        = string
}

variable "allow_external_principals" {
  description = "Allow external principals for RAM resource share"
  type        = bool
}

variable "ram_principal_arn" {
  description = "ARN of RAM principal"
  type        = string
}

variable "map_publicip" {
  description = "Map public IP on launch"
  type        = bool
  default     = false
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on creation"
  type        = bool
  default     = false
}

variable "route_cidr_block" {
  description = "CIDR block for route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ingress1_rule_no" {
  description = "Rule number for ingress rule 1"
  type        = number
}

variable "ingress1_fport" {
  description = "From port for ingress rule 1"
  type        = number
}

variable "ingress1_tport" {
  description = "To port for ingress rule 1"
  type        = number
}

variable "ingress1_protocol" {
  description = "Protocol for ingress rule 1"
  type        = string
}

variable "ingress1_cidr" {
  description = "CIDR block for ingress rule 1"
  type        = string
}

variable "ingress1_action" {
  description = "Action for ingress rule 1"
  type        = string
}

variable "egress1_rule_no" {
  description = "Rule number for egress rule 1"
  type        = number
}

variable "egress1_fport" {
  description = "From port for egress rule 1"
  type        = number
}

variable "egress1_tport" {
  description = "To port for egress rule 1"
  type        = number
}

variable "egress1_protocol" {
  description = "Protocol for egress rule 1"
  type        = string
}

variable "egress1_cidr" {
  description = "CIDR block for egress rule 1"
  type        = string
}

variable "egress1_action" {
  description = "Action for egress rule 1"
  type        = string
}
