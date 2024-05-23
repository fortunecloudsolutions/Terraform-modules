
locals {
  tag_pairs = var.tags
}

resource "aws_lb_target_group" "alb" {
  name                          = var.target_group_name
  port                          = var.target_port
  protocol                      = var.target_protocol
  vpc_id                        = var.target_vpc_id
  deregistration_delay          = var.deregistration_delay
  slow_start                    = var.slow_start
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
  target_type                   = var.target_type
  tags                          = local.tag_pairs

  stickiness {
    type            = var.sticky_type
    cookie_duration = var.sticky_cookie_duration
    enabled         = var.sticky_enabled
  }

  health_check {
    enabled             = var.health_check_enabled
    interval            = var.health_check_interval
    path                = var.health_check_path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher             = var.health_check_success_resp_code
  }

}
