aws_perimeter_access_key_id       = "YOUR_AWS_PERIMETER_ACCESS_KEY_ID"
aws_perimeter_secret_access_key   = "YOUR_AWS_PERIMETER_SECRET_ACCESS_KEY"
aws_centralhub_access_key_id      = "YOUR_AWS_CENTRALHUB_ACCESS_KEY_ID"
aws_centralhub_secret_access_key  = "YOUR_AWS_CENTRALHUB_SECRET_ACCESS_KEY"
aws_production_access_key_id      = "YOUR_AWS_PRODUCTION_ACCESS_KEY_ID"
aws_production_secret_access_key  = "YOUR_AWS_PRODUCTION_SECRET_ACCESS_KEY"
aws_performance_access_key_id     = "YOUR_AWS_PERFORMANCE_ACCESS_KEY_ID"
aws_performance_secret_access_key = "YOUR_AWS_PERFORMANCE_SECRET_ACCESS_KEY"
aws_development_access_key_id     = "YOUR_AWS_DEVELOPMENT_ACCESS_KEY_ID"
aws_development_secret_access_key = "YOUR_AWS_DEVELOPMENT_SECRET_ACCESS_KEY"

vpc_cidr_blocks = {
  perimeter = {
    vpc1 = "10.0.0.0/16"
    vpc2 = "10.1.0.0/16"
  }
  centralhub = {
    vpc1 = "10.2.0.0/16"
  }
}

availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]

gateway_id = "YOUR_INTERNET_GATEWAY_ID"

transit_gateway_description = "My Transit Gateway"
auto_accept_shared_attachments = "enable"
default_route_table_association = "enable"
default_route_table_propagation = "enable"
dns_support = "enable"
multicast_support = "enable"
vpn_ecmp_support = "enable"
transit_gateway_name = "main-transit-gateway"
ram_resource_share_name = "TGW-Share"
allow_external_principals = true
ram_principal_arn = "arn:aws:organizations::centralhub:organization/centralhub_ORG_ID"
map_publicip = false
assign_ipv6_address_on_creation = false
route_cidr_block = "0.0.0.0/0"
ingress1_rule_no = 100
ingress1_fport = 0
ingress1_tport = 65535
ingress1_protocol = "-1"
ingress1_cidr = "0.0.0.0/0"
ingress1_action = "allow"
egress1_rule_no = 100
egress1_fport = 0
egress1_tport = 65535
egress1_protocol = "-1"
egress1_cidr = "0.0.0.0/0"
egress1_action = "allow"
