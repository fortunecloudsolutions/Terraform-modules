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
