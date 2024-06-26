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
    perimeter_edge = [for rt in module.route_tables_perimeter_edge : rt.id]
    perimeter_egress = [for rt in module.route_tables_perimeter_egress : rt.id]
    centralhub = [for rt in module.route_tables_centralhub : rt.id]
  }
}

output "network_acl_ids" {
  value = {
    perimeter_edge = module.network_acl_perimeter_edge.nacl_id
    perimeter_egress = module.network_acl_perimeter_egress.nacl_id
  }
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.tgw.id
}
