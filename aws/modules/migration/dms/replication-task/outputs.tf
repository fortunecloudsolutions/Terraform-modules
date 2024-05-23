output "replication_task_arn" {
  #{"type":"string","default":"arn:dummy"}
  description = "The Amazon Resource Name (ARN) for the replication task."
  value       = aws_dms_replication_task.replication_task.replication_task_arn
}

output "replication_task_id" {
  #{"type":"string","default":"arn:dummy"}
  description = "The replication task identifier."
  value       = var.replication_task_id
}