resource "aws_network_acl" "main_nacl" {
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  egress {
    # count = var.egress_enable ? 1:0
    protocol        = var.egress1_protocol
    rule_no         = var.egress1_rule_no
    action          = var.egress1_action
    cidr_block      = var.egress1_cidr
    from_port       = var.egress1_fport
    to_port         = var.egress1_tport
    ipv6_cidr_block = var.egress1_ipv6_cidr
    icmp_type       = var.egress1_icmp_type
    icmp_code       = var.egress1_icmp_code
  }

  ingress {
    # count = var.ingress_enable ? 1:0
    protocol        = var.ingress1_protocol
    rule_no         = var.ingress1_rule_no
    action          = var.ingress1_action
    cidr_block      = var.ingress1_cidr
    from_port       = var.ingress1_fport
    to_port         = var.ingress1_tport
    ipv6_cidr_block = var.ingress1_ipv6_cidr
    icmp_type       = var.ingress1_icmp_type
    icmp_code       = var.ingress1_icmp_code
  }

  tags = var.tags
}
