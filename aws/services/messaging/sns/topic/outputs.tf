output "id" {
  #{"type":"string","default":"dummy"}
  description = "The ARN of the SNS topic"
  value       = module.topic.sns_id
}

output "arn" {
  #{"type":"string","default":"arn:aws:sns:us-east-2:046692759124:Default_CloudWatch_Alarms_Topic"}
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
  value       = module.topic.sns_arn
}
