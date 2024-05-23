output "id" {
  description = "The task_set_id, service and cluster separated by commas (,)."
  value       = aws_ecs_task_set.task_set.id
}
output "arn" {
  description = "The Amazon Resource Name (ARN) that identifies the task set."
  value       = aws_ecs_task_set.task_set.arn
}
output "stability_status" {
  description = " The stability status. This indicates whether the task set has reached a steady state."
  value       = aws_ecs_task_set.task_set.stability_status
}
output "status" {
  description = " The status of the task set."
  value       = aws_ecs_task_set.task_set.status
}
output "task_set_id" {
  description = " The ID of the task set."
  value       = aws_ecs_task_set.task_set.task_set_id
}
output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_ecs_task_set.task_set.tags_all
}
