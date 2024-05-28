provider "aws" {
  alias  = "perimeter"
  region = "us-west-2"
  access_key = var.aws_perimeter_access_key_id
  secret_key = var.aws_perimeter_secret_access_key
}

provider "aws" {
  alias  = "centralhub"
  region = "us-west-2"
  access_key = var.aws_centralhub_access_key_id
  secret_key = var.aws_centralhub_secret_access_key
}

provider "aws" {
  alias  = "production"
  region = "us-west-2"
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}

provider "aws" {
  alias  = "production_east"
  region = "us-east-1"
  access_key = var.aws_production_access_key_id
  secret_key = var.aws_production_secret_access_key
}

provider "aws" {
  alias  = "performance"
  region = "us-west-2"
  access_key = var.aws_performance_access_key_id
  secret_key = var.aws_performance_secret_access_key
}

provider "aws" {
  alias  = "development"
  region = "us-west-2"
  access_key = var.aws_development_access_key_id
  secret_key = var.aws_development_secret_access_key
}

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

resource "aws_vpc" "vpc_perimeter_edge" {
  provider   = aws.perimeter
  cidr_block = var.vpc_cidr_blocks["perimeter"]["vpc1"]

  tags = {
    Name = "Perimeter-edge"
  }
}

resource "aws_vpc" "vpc_perimeter_egress" {
  provider   = aws.perimeter
  cidr_block = var.vpc_cidr_blocks["perimeter"]["vpc2"]

  tags = {
    Name = "Perimeter-egress"
  }
}

resource "aws_vpc" "vpc_centralhub" {
  provider   = aws.centralhub
  cidr_block = var.vpc_cidr_blocks["centralhub"]["vpc1"]

  tags = {
    Name = "CentralHub"
  }
}

resource "aws_ec2_transit_gateway" "tgw" {
  provider = aws.perimeter
  description = "My Transit Gateway"

  auto_accept_shared_attachments = "enable"
  default_route_table_association = "enable"
  default_route_table_propagation = "enable"
  dns_support = "enable"
  multicast_support = "enable"
  vpn_ecmp_support = "enable"

  tags = {
    Name = "main-transit-gateway"
  }
}

resource "aws_ram_resource_share" "tgw_share" {
  provider = aws.perimeter
  name     = "TGW-Share"

  allow_external_principals = true

  tags = {
    Name = "TGW-Share"
  }
}

resource "aws_ram_principal_association" "tgw_principal_association" {
  provider            = aws.perimeter
  resource_share_arn  = aws_ram_resource_share.tgw_share.arn
  principal           = "arn:aws:organizations::centralhub:organization/centralhub_ORG_ID"  # Replace with the ARN of the account B
}

resource "aws_ram_resource_association" "tgw_resource_association" {
  provider            = aws.perimeter
  resource_share_arn  = aws_ram_resource_share.tgw_share.arn
  resource_arn        = aws_ec2_transit_gateway.tgw.arn
}

module "subnets_perimeter_edge" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(12))
  vpc_id              = aws_vpc.vpc_perimeter_edge.id
  cidr_subnet         = cidrsubnet(aws_vpc.vpc_perimeter_edge.cidr_block, 4, each.key)
  map_publicip        = false
  availability_zone   = element(var.availability_zones, each.key % length(var.availability_zones))
  assign_ipv6_address_on_creation = false
  tags                = {
    Name = "Perimeter-edge-subnet-${each.key}"
  }
}

module "subnets_perimeter_egress" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(12))
  vpc_id              = aws_vpc.vpc_perimeter_egress.id
  cidr_subnet         = cidrsubnet(aws_vpc.vpc_perimeter_egress.cidr_block, 4, each.key)
  map_publicip        = false
  availability_zone   = element(var.availability_zones, each.key % length(var.availability_zones))
  assign_ipv6_address_on_creation = false
  tags                = {
    Name = "Perimeter-egress-subnet-${each.key}"
  }
}

module "subnets_centralhub" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(12))
  vpc_id              = aws_vpc.vpc_centralhub.id
  cidr_subnet         = cidrsubnet(aws_vpc.vpc_centralhub.cidr_block, 4, each.key)
  map_publicip        = false
  availability_zone   = element(var.availability_zones, each.key % length(var.availability_zones))
  assign_ipv6_address_on_creation = false
  tags                = {
    Name = "CentralHub-subnet-${each.key}"
  }
}

module "route_tables_perimeter_edge" {
  source              = "./Terraform-modules/aws/modules/network/route-table"
  for_each            = toset(range(7))
  vpc_id              = aws_vpc.vpc_perimeter_edge.id
  route               = {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw_id"  # Replace with actual Internet Gateway ID
  }
  tags                = {
    Name = "Perimeter-edge-route-table-${each.key}"
  }
}

module "route_tables_perimeter_egress" {
  source              = "./Terraform-modules/aws/modules/network/route-table"
  for_each            = toset(range(7))
  vpc_id              = aws_vpc.vpc_perimeter_egress.id
  route               = {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw_id"  # Replace with actual Internet Gateway ID
  }
  tags                = {
    Name = "Perimeter-egress-route-table-${each.key}"
  }
}

module "route_tables_centralhub" {
  source              = "./Terraform-modules/aws/modules/network/route-table"
  for_each            = toset(range(7))
  vpc_id              = aws_vpc.vpc_centralhub.id
  route               = {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw_id"  # Replace with actual Internet Gateway ID
  }
  tags                = {
    Name = "Centralhub-route-table-${each.key}"
  }
}

module "network_acl_perimeter_edge" {
  source              = "./Terraform-modules/aws/modules/network/nacl"
  vpc_id              = aws_vpc.vpc_perimeter_edge.id
  subnet_ids          = module.subnets_perimeter_edge[*].subnet_id
  ingress1_rule_no    = 100
  ingress1_fport      = 0
  ingress1_tport      = 65535
  ingress1_protocol   = "-1"
  ingress1_cidr       = "0.0.0.0/0"
  ingress1_action     = "allow"
  egress1_rule_no     = 100
  egress1_fport       = 0
  egress1_tport       = 65535
  egress1_protocol    = "-1"
  egress1_cidr        = "0.0.0.0/0"
  egress1_action      = "allow"
  tags                = {
    Name = "Perimeter-edge-nacl"
  }
}

module "network_acl_perimeter_egress" {
  source              = "./Terraform-modules/aws/modules/network/nacl"
  vpc_id              = aws_vpc.vpc_perimeter_egress.id
  subnet_ids          = module.subnets_perimeter_egress[*].subnet_id
  ingress1_rule_no    = 100
  ingress1_fport      = 0
  ingress1_tport      = 65535
  ingress1_protocol   = "-1"
  ingress1_cidr       = "0.0.0.0/0"
  ingress1_action     = "allow"
  egress1_rule_no     = 100
  egress1_fport       = 0
  egress1_tport       = 65535
  egress1_protocol    = "-1"
  egress1_cidr        = "0.0.0.0/0"
  egress1_action      = "allow"
  tags                = {
    Name = "Perimeter-egress-nacl"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_perimeter_edge" {
  provider            = aws.perimeter
  subnet_ids          = module.subnets_perimeter_edge[*].subnet_id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_perimeter_edge.id

  tags = {
    Name = "VPC-Attachment-Perimeter-Edge"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_perimeter_egress" {
  provider            = aws.perimeter
  subnet_ids          = module.subnets_perimeter_egress[*].subnet_id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_perimeter_egress.id

  tags = {
    Name = "VPC-Attachment-Perimeter-Egress"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_centralhub" {
  provider            = aws.centralhub
  subnet_ids          = module.subnets_centralhub[*].subnet_id
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_centralhub.id

  tags = {
    Name = "VPC-Attachment-CentralHub"
  }
}
