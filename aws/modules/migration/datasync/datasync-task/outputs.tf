output "datasync_task_arn" {
  #{"type":"string","default":"arn:aws:datasync:us-east-2:111222333444:task/task-08de6e6697796f026"}
  description = "Amazon Resource Name (ARN) of the DataSync Location."
  value       = aws_datasync_task.task.arn
}