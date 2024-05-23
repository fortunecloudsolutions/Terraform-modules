resource "aws_vpc" "vpc_account_a_1" {
  provider   = aws.account_a
  cidr_block = var.vpc_cidr_blocks["account_a"]["vpc1"]

  tags = {
    Name = "VPC-Account-A-1"
  }
}

resource "aws_vpc" "vpc_account_a_2" {
  provider   = aws.account_a
  cidr_block = var.vpc_cidr_blocks["account_a"]["vpc2"]

  tags = {
    Name = "VPC-Account-A-2"
  }
}

resource "aws_vpc" "vpc_account_b_1" {
  provider   = aws.account_b
  cidr_block = var.vpc_cidr_blocks["account_b"]["vpc1"]

  tags = {
    Name = "VPC-Account-B-1"
  }
}

resource "aws_ec2_transit_gateway" "tgw" {
  provider = aws.account_a
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
  provider = aws.account_a
  name     = "TGW-Share"

  allow_external_principals = true

  tags = {
    Name = "TGW-Share"
  }
}

resource "aws_ram_principal_association" "tgw_principal_association" {
  provider            = aws.account_a
  resource_share_arn  = aws_ram_resource_share.tgw_share.arn
  principal           = "arn:aws:organizations::ACCOUNT_B:organization/ACCOUNT_B_ORG_ID"  # Replace with the ARN of the account B
}

resource "aws_ram_resource_association" "tgw_resource_association" {
  provider            = aws.account_a
  resource_share_arn  = aws_ram_resource_share.tgw_share.arn
  resource_arn        = aws_ec2_transit_gateway.tgw.arn
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_a_1" {
  provider            = aws.account_a
  subnet_ids          = [aws_vpc.vpc_account_a_1.id]
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_account_a_1.id

  tags = {
    Name = "VPC-Attachment-Account-A-1"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_a_2" {
  provider            = aws.account_a
  subnet_ids          = [aws_vpc.vpc_account_a_2.id]
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_account_a_2.id

  tags = {
    Name = "VPC-Attachment-Account-A-2"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_vpc_attachment_b_1" {
  provider            = aws.account_b
  subnet_ids          = [aws_vpc.vpc_account_b_1.id]
  transit_gateway_id  = aws_ec2_transit_gateway.tgw.id
  vpc_id              = aws_vpc.vpc_account_b_1.id

  tags = {
    Name = "VPC-Attachment-Account-B-1"
  }
}
