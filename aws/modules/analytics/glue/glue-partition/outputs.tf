output "id" {
  description = "partition id."
  value       = aws_glue_partition.partition.id
}

output "last_analyzed_time" {
  description = "The last time at which column statistics were computed for this partition."
  value       = aws_glue_partition.partition.last_analyzed_time
}

output "creation_time" {
  description = "The time at which the partition was created."
  value       = aws_glue_partition.partition.creation_time
}

output "last_accessed_time" {
  description = "The last time at which the partition was accessed."
  value       = aws_glue_partition.partition.last_accessed_time
}