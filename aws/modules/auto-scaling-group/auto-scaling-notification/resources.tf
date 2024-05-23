resource "aws_autoscaling_notification" "asg_notification" {

  group_names   = var.asg_group_names
  notifications = var.notification_types
  topic_arn     = var.topic_arn

}
