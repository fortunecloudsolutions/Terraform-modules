output "id" {
  #{"type":"string","default":"test-table,arn:aws:kinesis:us-east-2:046692759124:stream/test-kinesis"}
  description = "The table_name and stream_arn separated by a comma (,)."
  value       = module.kinesis_streaming_destination.id
}
