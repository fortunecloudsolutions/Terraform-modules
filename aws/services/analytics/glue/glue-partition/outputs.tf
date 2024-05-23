output "id" { 
  #{"type":"string","default":"046692759124:test-catalog-database:test-catalog-table:test4"}
  description = "partition id."
  value       = module.partition.id
}

output "last_analyzed_time" {
  #{"type":"string","default":"dummy"}
  description = "The last time at which column statistics were computed for this partition."
  value       = module.partition.last_analyzed_time
}

output "creation_time" {
  #{"type":"string","default":"2021-06-21T17:11:38Z"}
  description = "The time at which the partition was created."
  value       = module.partition.creation_time
}

output "last_accessed_time" {
  #{"type":"string","default":"dummy"}
  description = "The last time at which the partition was accessed."
  value       = module.partition.last_accessed_time
}