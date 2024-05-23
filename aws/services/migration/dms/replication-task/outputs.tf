output "replication_task_arn" {
  #{"type":"string","default":"arn:aws:dms:us-east-1:123456789012:task:K55IUCGBASJS5VHZJIINA45FII"}
  description = "The Amazon Resource Name (ARN) for the replication task."
  value       = module.replication_task.replication_task_arn
}

output "replication_task_id" {
  #{"type":"string","default":"dummy"}
  description = "The replication task identifier."
  value       = module.replication_task.replication_task_id
}
