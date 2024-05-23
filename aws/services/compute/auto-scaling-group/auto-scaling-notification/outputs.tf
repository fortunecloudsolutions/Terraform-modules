output "asg_groupnames" {
  #{"type":"string","default":"dummy"}
  description = "A list of AutoScaling Group Names"
  value       = module.asg_notification.asg_notification_groupnames
}

output "asg_notification" {
  #{"type":"string","default":"dummy"}
  description = "A list of Notification Types that trigger notifications."
  value       = module.asg_notification.asg_notification_notifications
}

output "topic_arn" {
  #{"type":"string","default":"dummy"}
  description = "The Topic ARN for notifications to be sent through"
  value       = module.asg_notification.asg_notification_topic_arn
}
