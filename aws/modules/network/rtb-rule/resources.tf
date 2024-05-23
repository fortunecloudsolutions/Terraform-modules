resource "aws_route" "rtb_rule" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = lookup(var.route, "cidr_block", null)
  egress_only_gateway_id    = lookup(var.route, "egress_only_gateway_id", null)
  gateway_id                = lookup(var.route, "gateway_id", null)
  instance_id               = lookup(var.route, "instance_id", null)
  nat_gateway_id            = lookup(var.route, "nat_gateway_id", null)
  local_gateway_id          = lookup(var.route, "local_gateway_id", null)
  network_interface_id      = lookup(var.route, "network_interface_id", null)
  transit_gateway_id        = lookup(var.route, "transit_gateway_id", null)
  vpc_peering_connection_id = lookup(var.route, "vpc_peering_connection_id", null)

}