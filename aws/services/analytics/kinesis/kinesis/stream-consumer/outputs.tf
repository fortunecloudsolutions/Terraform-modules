output "arn" {
  #{"type":"string","default":"arn:aws:kinesis:us-east-2:046692759124:stream/test-kinesis-stream/consumer/test-stream-consumer:1623766826"}
  description = "Amazon Resource Name (ARN) of the stream consumer."
  value       = module.stream_consumer.arn
}

output "creation_timestamp" {
  #{"type":"string","default":"2021-06-15T14:20:26Z"}
  description = "Approximate timestamp in RFC3339 format of when the stream consumer was created."
  value       = module.stream_consumer.creation_timestamp
}

output "id" {
  #{"type":"string","default":"arn:aws:kinesis:us-east-2:046692759124:stream/test-kinesis-stream/consumer/test-stream-consumer:1623766826"}
  description = " Amazon Resource Name (ARN) of the stream consumer."
  value       = module.stream_consumer.id
}