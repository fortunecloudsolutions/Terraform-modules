resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = var.asg_name
  elb                    = var.target_group_arn != null ? null : (var.elb_name != null ? var.elb_name : null)
  alb_target_group_arn   = var.target_group_arn != null ? var.target_group_arn : null


  lifecycle {
    create_before_destroy = true
  }
}