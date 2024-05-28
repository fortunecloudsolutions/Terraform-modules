resource "aws_network_acl_rule" "nacl_rule" {
  network_acl_id = var.nacl_id
  protocol       = var.protocol
  rule_number    = var.rule_no
  egress         = var.egress_enable
  rule_action    = var.action
  cidr_block     = var.cidr
  from_port      = var.fport
  to_port        = var.tport
}
