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
  description = var.transit_gateway_description

  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  dns_support = var.dns_support
  multicast_support = var.multicast_support
  vpn_ecmp_support = var.vpn_ecmp_support

  tags = {
    Name = var.transit_gateway_name
  }
}

resource "aws_ram_resource_share" "tgw_share" {
  provider = aws.perimeter
  name     = var.ram_resource_share_name

  allow_external_principals = var.allow_external_principals

  tags = {
    Name = var.ram_resource_share_name
  }
}

resource "aws_ram_principal_association" "tgw_principal_association" {
  provider            = aws.perimeter
  resource_share_arn  = aws_ram_resource_share.tgw_share.arn
  principal           = var.ram_principal_arn
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
  map_publicip        = var.map_publicip
  availability_zone   = element(var.availability_zones, each.key % length(var.availability_zones))
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags                = {
    Name = "Perimeter-edge-subnet-${each.key}"
  }
}

module "subnets_perimeter_egress" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(12))
  vpc_id              = aws_vpc.vpc_perimeter_egress.id
  cidr_subnet         = cidrsubnet(aws_vpc.vpc_perimeter_egress.cidr_block, 4, each.key)
  map_publicip        = var.map_publicip
  availability_zone   = element(var.availability_zones, each.key % length(var.availability_zones))
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags                = {
    Name = "Perimeter-egress-subnet-${each.key}"
  }
}

module "subnets_centralhub" {
  source              = "./Terraform-modules/aws/modules/network/subnet"
  for_each            = toset(range(12))
  vpc_id              = aws_vpc.vpc_centralhub.id
  cidr_subnet         = cidrsubnet(aws_vpc.vpc_centralhub.cidr_block, 4, each.key)
  map_publicip        = var.map_publicip
  availability_zone   = element(var.availability_zones, each.key % length(var.availability_zones))
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags                = {
    Name = "CentralHub-subnet-${each.key}"
  }
}

module "route_tables_perimeter_edge" {
  source              = "./Terraform-modules/aws/modules/network/route-table"
  for_each            = toset(range(7))
  vpc_id              = aws_vpc.vpc_perimeter_edge.id
  route               = {
    cidr_block = var.route_cidr_block
    gateway_id = var.gateway_id
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
    cidr_block = var.route_cidr_block
    gateway_id = var.gateway_id
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
    cidr_block = var.route_cidr_block
    gateway_id = var.gateway_id
  }
  tags                = {
    Name = "Centralhub-route-table-${each.key}"
  }
}

module "network_acl_perimeter_edge" {
  source              = "./Terraform-modules/aws/modules/network/nacl"
  vpc_id              = aws_vpc.vpc_perimeter_edge.id
  subnet_ids          = module.subnets_perimeter_edge[*].subnet_id
  ingress1_rule_no    = var.ingress1_rule_no
  ingress1_fport      = var.ingress1_fport
  ingress1_tport      = var.ingress1_tport
  ingress1_protocol   = var.ingress1_protocol
  ingress1_cidr       = var.ingress1_cidr
  ingress1_action     = var.ingress1_action
  egress1_rule_no     = var.egress1_rule_no
  egress1_fport       = var.egress1_fport
  egress1_tport       = var.egress1_tport
  egress1_protocol    = var.egress1_protocol
  egress1_cidr        = var.egress1_cidr
  egress1_action      = var.egress1_action
  tags                = {
    Name = "Perimeter-edge-nacl"
  }
}

module "network_acl_perimeter_egress" {
  source              = "./Terraform-modules/aws/modules/network/nacl"
  vpc_id              = aws_vpc.vpc_perimeter_egress.id
  subnet_ids          = module.subnets_perimeter_egress[*].subnet_id
  ingress1_rule_no    = var.ingress1_rule_no
  ingress1_fport      = var.ingress1_fport
  ingress1_tport      = var.ingress1_tport
  ingress1_protocol   = var.ingress1_protocol
  ingress1_cidr       = var.ingress1_cidr
  ingress1_action     = var.ingress1_action
  egress1_rule_no     = var.egress1_rule_no
  egress1_fport       = var.egress1_fport
  egress1_tport       = var.egress1_tport
  egress1_protocol    = var.egress1_protocol
  egress1_cidr        = var.egress1_cidr
  egress1_action      = var.egress1_action
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
