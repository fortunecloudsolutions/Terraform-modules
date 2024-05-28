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

resource "aws_route_table" "route_table_perimeter_edge" {
  provider = aws.perimeter
  vpc_id   = aws_vpc.vpc_perimeter_edge.id
  tags = {
    Name = "Perimeter-edge-route-table"
  }
}

resource "aws_route_table" "route_table_perimeter_egress" {
  provider = aws.perimeter
  vpc_id   = aws_vpc.vpc_perimeter_egress.id
  tags = {
    Name = "Perimeter-egress-route-table"
  }
}

resource "aws_route_table" "route_table_centralhub" {
  provider = aws.centralhub
  vpc_id   = aws_vpc.vpc_centralhub.id
  tags = {
    Name = "CentralHub-route-table"
  }
}

output "subnet_ids" {
  value = {
    perimeter_edge = [for subnet in module.subnets_perimeter_edge : subnet.subnet_id]
    perimeter_egress = [for subnet in module.subnets_perimeter_egress : subnet.subnet_id]
    centralhub = [for subnet in module.subnets_centralhub : subnet.subnet_id]
  }
}

output "route_table_ids" {
  value = {
    perimeter_edge = aws_route_table.route_table_perimeter_edge.id
    perimeter_egress = aws_route_table.route_table_perimeter_egress.id
    centralhub = aws_route_table.route_table_centralhub.id
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
