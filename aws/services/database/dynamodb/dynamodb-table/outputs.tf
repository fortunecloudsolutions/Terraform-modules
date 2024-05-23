output "arn" {
  #{"type":"string","default":"arn:aws:dynamodb:us-east-2:046692759124:table/test-table"}
  description = "The arn of the table"
  value       = module.table.arn
}

output "id" {
  #{"type":"string","default":"test-table"}
  description = "The name of the table"
  value       = module.table.id
}

output "stream_arn" {
  #{"type":"string","default":"arn:aws:dynamodb:us-east-2:046692759124:table/test-table/stream/2021-12-03T20:38:36.416"}
  description = "The ARN of the Table Stream. Only available when stream_enabled = true"
  value       = module.table.stream_arn
}

output "stream_label" {
  #{"type":"string","default":"2021-12-03T20:38:36.416"}
  description = "A timestamp, in ISO 8601 format, for this stream. Note that this timestamp is not a unique identifier for the stream on its own. However, the combination of AWS customer ID, table name and this field is guaranteed to be unique. It can be used for creating CloudWatch Alarms. Only available when stream_enabled = true"
  value       = module.table.stream_label
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.table.tags_all
}
