output "arn" {
  #{"type":"string","default":"arn:aws:cloudwatch:us-east-2:046692759124:alarm:test-alarm"}
  description = "The ARN of the CloudWatch Metric Alarm."
  value       = module.cloudwatch_metric_alarm.arn
}

output "alarm_name" {
  #{"type":"string","default":"test-alarm"}
  description = "The name of the CloudWatch Metric Alarm."
  value       = module.cloudwatch_metric_alarm.alarm_name
}

output "id" {
  #{"type":"string","default":"test-alarm"}
  description = "The ID of the health check."
  value       = module.cloudwatch_metric_alarm.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cloudwatch_metric_alarm.tags_all
}


