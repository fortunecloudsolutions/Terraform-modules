output "arn" {
  description = "The arn of the table"
  value       = aws_dynamodb_table.table.arn
}

output "id" {
  description = "The name of the table"
  value       = aws_dynamodb_table.table.id
}

output "stream_arn" {
  description = "The ARN of the Table Stream. Only available when stream_enabled = true"
  value       = aws_dynamodb_table.table.stream_arn
}

output "stream_label" {
  description = "A timestamp, in ISO 8601 format, for this stream. Note that this timestamp is not a unique identifier for the stream on its own. However, the combination of AWS customer ID, table name and this field is guaranteed to be unique. It can be used for creating CloudWatch Alarms. Only available when stream_enabled = true"
  value       = aws_dynamodb_table.table.stream_label
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_dynamodb_table.table.tags_all
}
