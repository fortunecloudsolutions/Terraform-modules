resource "aws_autoscaling_schedule" "asg_schedule" {
  autoscaling_group_name = var.autoscaling_group_name
  scheduled_action_name  = var.scheduled_action_name
  start_time             = var.start_time
  end_time               = var.end_time
  recurrence             = var.recurrence
  min_size               = var.min_size
  max_size               = var.max_size
  desired_capacity       = var.desired_capacity
}