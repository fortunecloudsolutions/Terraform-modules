output "arn" {
  description = "Amazon Resource Name (ARN) of the stream consumer."
  value       = aws_kinesis_stream_consumer.stream_consumer.arn
}

output "creation_timestamp" {
  description = "Approximate timestamp in RFC3339 format of when the stream consumer was created."
  value       = aws_kinesis_stream_consumer.stream_consumer.creation_timestamp
}

output "id" {
  description = " Amazon Resource Name (ARN) of the stream consumer."
  value       = aws_kinesis_stream_consumer.stream_consumer.id
}