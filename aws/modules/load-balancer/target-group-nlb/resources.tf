
locals {
  tag_pairs = var.tags
}

resource "aws_lb_target_group" "nlb" {
  name                 = var.target_group_name
  port                 = var.target_port
  protocol             = var.target_protocol
  vpc_id               = var.target_vpc_id
  deregistration_delay = var.deregistration_delay
  target_type          = var.target_type
  tags                 = local.tag_pairs

  health_check {
    enabled             = var.health_check_enabled
    interval            = var.health_check_interval
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    healthy_threshold   = var.healthy_unhealthy_threshold
    unhealthy_threshold = var.healthy_unhealthy_threshold
  }

}
