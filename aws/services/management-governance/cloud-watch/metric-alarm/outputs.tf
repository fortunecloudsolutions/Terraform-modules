output "cloudwatch_metric_id" {
  #{"type":"string","default":"dummy"}
  description = "The ID of the health check"
  value       = module.cloudwatch_metric.cloudwatch_metric_id
}

output "cloudwatch_metric_arn" {
  #{"type":"string","default":"arn:aws:cloudwatch:us-east-2:046692759124:alarm:MyTestAlarm"}
  description = "The ARN of the cloudwatch metric alarm"
  value       = module.cloudwatch_metric.cloudwatch_metric_arn
}
