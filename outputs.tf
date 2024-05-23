output "vpc_ids" {
  value = {
    account_a_vpc1 = aws_vpc.vpc_account_a_1.id
    account_a_vpc2 = aws_vpc.vpc_account_a_2.id
    account_b_vpc1 = aws_vpc.vpc_account_b_1.id
  }
}

output "transit_gateway_id" {
  value = aws_ec2_transit_gateway.tgw.id
}
