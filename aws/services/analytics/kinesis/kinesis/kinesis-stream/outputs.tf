output "id" {
  #{"type":"string","default":"arn:aws:kinesis:us-east-2:046692759124:stream/test-kinesis-stream"}
  description = "The unique Stream id"
  value       = module.kinesis_stream.id
}

output "name" {
  #{"type":"string","default":"dummy"}
  description = "The unique Stream name"
  value       = module.kinesis_stream.name
}

output "shard_count" {
  #{"type":"number","default":"1"}
  description = " The count of Shards for this Stream"
  value       = module.kinesis_stream.shard_count
}

output "arn" {
  #{"type":"string","default":"arn:aws:kinesis:us-east-2:046692759124:stream/test-kinesis-stream"}
  description = "The Amazon Resource Name (ARN) specifying the Stream (same as id)"
  value       = module.kinesis_stream.arn
}

output "tags_all" {
  #{"type":"map","default":"{}"}
  description = "The unique Stream id"
  value       = module.kinesis_stream.tags_all
}