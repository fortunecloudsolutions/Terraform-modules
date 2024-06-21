resource "aws_ec2_transit_gateway" "this" {
  description = "Transit Gateway for ${var.env} environment"
  dns_support = "enable"
  vpn_ecmp_support = "enable"
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments = "disable"
  multicast_support = "disable"

  tags = {
    Name = "ctc-vis-${var.env}-transit-gateway"
    Environment = var.env
  }
}

resource "aws_ram_resource_share" "this" {
  name = "tgw-share-${var.env}"
  allow_external_principals = false

  tags = {
    Name = "ctc-vis-${var.env}-transit-gateway-share"
    Environment = var.env
  }

  resource {
    resource_arn = aws_ec2_transit_gateway.this.arn
  }
}
