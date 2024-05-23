output "asg_notification_groupnames" {
  description = "A list of AutoScaling Group Names"
  value       = aws_autoscaling_notification.asg_notification.group_names
}

output "asg_notification_notifications" {
  description = "A list of Notification Types that trigger notifications."
  value       = aws_autoscaling_notification.asg_notification.notifications
}

output "asg_notification_topic_arn" {
  description = "The Topic ARN for notifications to be sent through"
  value       = aws_autoscaling_notification.asg_notification.topic_arn
}
