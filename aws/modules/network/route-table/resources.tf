resource "aws_route_table" "example" {
  vpc_id = var.vpc_id

  dynamic "route" {
    for_each = var.route != null ? [var.route] : []
    content {
      cidr_block = lookup(route.value, "cidr_block")
      gateway_id = lookup(route.value, "gateway_id")
    }
  }

  tags = var.tags
}
