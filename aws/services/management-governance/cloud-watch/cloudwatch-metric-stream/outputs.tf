output "arn" {
  #{"type":"string","default":"arn:aws:cloudwatch:us-east-2:046692759124:metric-stream/terraform-20211026211834132800000001"}
  description = "ARN of the metric stream."
  value       = module.cloudwatch_metric_stream.arn
}

output "creation_date" {
  #{"type":"string","default":"2021-10-26T21:18:34Z"}
  description = "Date and time in RFC3339 format that the metric stream was created."
  value       = module.cloudwatch_metric_stream.creation_date
}

output "last_update_date" {
  #{"type":"string","default":"2021-10-26T21:18:34Z"}
  description = "Date and time in RFC3339 format that the metric stream was last updated."
  value       = module.cloudwatch_metric_stream.last_update_date
}

output "state" {
  #{"type":"string","default":"running"}
  description = "State of the metric stream. Possible values are running and stopped."
  value       = module.cloudwatch_metric_stream.state
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.cloudwatch_metric_stream.tags_all
}
