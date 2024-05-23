resource "aws_security_group_rule" "add_rule" {
  count                    = var.num_of_rules
  description              = var.desc[count.index]
  type                     = var.rule_type[count.index]
  from_port                = var.fport[count.index]
  to_port                  = var.tport[count.index]
  protocol                 = var.protocol[count.index]
  cidr_blocks              = var.cidr[count.index]
  ipv6_cidr_blocks         = var.ipv6_cidr[count.index]
  prefix_list_ids          = var.prefix_ids[count.index]
  security_group_id        = var.security_group_id
  source_security_group_id = var.src_security_group_id[count.index]
}

