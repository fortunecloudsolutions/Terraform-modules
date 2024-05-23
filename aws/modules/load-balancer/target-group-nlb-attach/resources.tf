
resource "aws_lb_target_group_attachment" "register" {
  target_group_arn  = var.target_group_arn
  target_id         = var.instance_ip_ecscontainer_lambda_arn[count.index]
  port              = var.target_port
  availability_zone = var.target_type == "ip_address" ? var.az_ip_address : ""
  count             = var.number_of_targets
}

