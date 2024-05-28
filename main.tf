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

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_a_1" {
  provider            = aws.perimeter
  subnet_ids          = [aws_vpc.vpc_perimeter_1.id]
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_perimeter_1.id

  tags = {
    Name = "VPC-Attachment-Account-A-1"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_a_2" {
  provider            = aws.perimeter
  subnet_ids          = [aws_vpc.vpc_perimeter_2.id]
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_perimeter_2.id

  tags = {
    Name = "VPC-Attachment-Account-A-2"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_b_1" {
  provider            = aws.centralhub
  subnet_ids          = [aws_vpc.vpc_centralhub_1.id]
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_centralhub_1.id

  tags = {
    Name = "VPC-Attachment-Account-B-1"
  }
}
