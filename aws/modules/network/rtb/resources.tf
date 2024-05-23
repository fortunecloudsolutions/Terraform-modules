resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.route != null ? var.route : []
    content {
      cidr_block                = lookup(route.value, "cidr_block", null)
      egress_only_gateway_id    = lookup(route.value, "egress_only_gateway_id", null)
      gateway_id                = lookup(route.value, "gateway_id", null)
      instance_id               = lookup(route.value, "instance_id", null)
      nat_gateway_id            = lookup(route.value, "nat_gateway_id", null)
      local_gateway_id          = lookup(route.value, "local_gateway_id", null)
      network_interface_id      = lookup(route.value, "network_interface_id", null)
      transit_gateway_id        = lookup(route.value, "transit_gateway_id", null)
      vpc_peering_connection_id = lookup(route.value, "vpc_peering_connection_id", null)
    }
  }

  tags             = var.tags
  propagating_vgws = var.propagating_vgws

}