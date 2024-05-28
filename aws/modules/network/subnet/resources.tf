resource "aws_subnet" "subnet_public" {
  vpc_id                          = var.vpc_id
  cidr_block                      = var.cidr_subnet
  map_public_ip_on_launch         = var.map_publicip
  availability_zone               = var.availability_zone
  tags                            = var.tags
  ipv6_cidr_block                 = var.ipv6_cidr_block
  outpost_arn                     = var.outpost_arn
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
}
