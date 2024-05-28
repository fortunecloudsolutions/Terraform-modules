output "vpc_ids" {
  value = {
    perimeter_edge = aws_vpc.vpc_perimeter_edge.id
    perimeter_egress = aws_vpc.vpc_perimeter_egress.id
    centralhub = aws_vpc.vpc_centralhub.id
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

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.tgw.id
}
