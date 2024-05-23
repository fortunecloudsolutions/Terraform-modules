resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_text
  vpc_id      = var.vpc_id

  ingress {
    description      = var.ingress1_desc
    from_port        = var.ingress1_fport
    to_port          = var.ingress1_tport
    protocol         = var.ingress1_protocol
    cidr_blocks      = var.ingress1_cidr
    ipv6_cidr_blocks = var.ingress1_ipv6_cidr
    prefix_list_ids  = var.ingress1_prefix_ids
    security_groups  = var.ingress1_security_groups
  }

  egress {
    description      = var.egress1_desc
    from_port        = var.egress1_fport
    to_port          = var.egress1_tport
    protocol         = var.egress1_protocol
    cidr_blocks      = var.egress1_cidr
    ipv6_cidr_blocks = var.egress1_ipv6_cidr
    prefix_list_ids  = var.egress1_prefix_ids
    security_groups  = var.egress1_security_groups
  }

}

