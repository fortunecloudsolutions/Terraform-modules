data "aws_vpc" "dns_server" {
  count = var.vpc_id == null ? 0 : 1
  id    = var.vpc_id
}

resource "aws_vpc_dhcp_options" "dns_resolver" {
  domain_name = var.domain_name
  domain_name_servers = (var.vpc_id != null ?
  [replace(data.aws_vpc.dns_server[0].cidr_block, "/.[0-9]+/[0-9]+/", ".2")] : var.domain_name_servers)
  ntp_servers          = var.ntp_servers
  netbios_name_servers = var.netbios_name_servers
  netbios_node_type    = var.netbios_node_type
  tags                 = var.tags

}

