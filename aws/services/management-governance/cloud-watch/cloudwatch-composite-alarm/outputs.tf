output "arn" {
  #{"type":"string","default":"arn:aws:cloudwatch:us-east-2:046692759124:alarm:test-composite-alarm"}
  description = "The ARN of the composite alarm."
  value       = module.composite_alarm.arn
}

output "id" {
  #{"type":"string","default":"test-composite-alarm"}
  description = "The ID of the composite alarm resource, which is equivalent to its alarm_name."
  value       = module.composite_alarm.id
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.composite_alarm.tags_all
}
